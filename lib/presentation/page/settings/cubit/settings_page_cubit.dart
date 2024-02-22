import 'dart:async';

import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/snackbar_properties.f.dart';

part 'settings_page_state.dart';

class SettingsPageCubit extends SafeCubit<SettingsPageState> {
  SettingsPageCubit(
    this._saveAppThemeType,
    this._getAppThemeTypeStream,
  ) : super(SettingsPageLoading()) {
    _appThemeTypeSubscription =
        _getAppThemeTypeStream().listen(_onAppThemeTypeChanged);
  }

  final SaveAppThemeTypeUseCase _saveAppThemeType;
  final GetAppThemeTypeStreamUseCase _getAppThemeTypeStream;
  StreamSubscription? _appThemeTypeSubscription;

  Future<void> setAppThemeType(AppThemeType? type) async {
    if(type == null) return;
    try {
      await _saveAppThemeType(type);
    } catch (e, _) {
      // TO-DO error
      // Log.e('$runtimeType - setAppThemeType error', LogTag.cubit, e, s);
    }
  }

  void _onAppThemeTypeChanged(AppThemeType type) {
    emit(SettingsPageIdle(savedAppThemeType: type));
  }

  @override
  Future<void> close() {
    _appThemeTypeSubscription?.cancel();
    _appThemeTypeSubscription = null;

    return super.close();
  }

  void showWarning(SnackbarProperties snackbarProperties) {
    emit(SettingsPageShowWarning(properties: snackbarProperties));
  }

  void showError(SnackbarProperties snackbarProperties) {
    emit(SettingsPageShowError(properties: snackbarProperties));
  }
}
