import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';

class SaveAppThemeTypeUseCase {
  const SaveAppThemeTypeUseCase(this._appThemeTypeStorage);

  final AppThemeTypeStorage _appThemeTypeStorage;

  Future<void> call(AppThemeType type) => _appThemeTypeStorage.saveType(type);
}
