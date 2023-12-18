import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _savedAppThemeTypeKey = 'savedAppThemeType';

class AppThemeTypeStorageImpl implements AppThemeTypeStorage {
  AppThemeTypeStorageImpl(this._preferences) {
    _appThemeSubject = BehaviorSubject.seeded(_getType());
  }

  final SharedPreferences _preferences;
  late BehaviorSubject<AppThemeType> _appThemeSubject;

  AppThemeType _getType() {
    return AppThemeType.values[_preferences.getInt(_savedAppThemeTypeKey) ?? 0];
  }

  @override
  Future<void> saveType(AppThemeType type) async {
    await _preferences.setInt(_savedAppThemeTypeKey, type.index);
    _appThemeSubject.add(type);
  }

  @override
  Stream<AppThemeType> getTypeStream() => _appThemeSubject.stream;

  @override
  AppThemeType? getCurrentType() {
    return _appThemeSubject.valueOrNull;
  }
}
