import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:iteo_libraries_example/core/extension/brightness_extensions.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';

class AppColorsProvider extends ChangeNotifier {
  AppColorsProvider(this._getAppThemeTypeStreamUseCase) {
    _init();
  }

  final GetAppThemeTypeStreamUseCase _getAppThemeTypeStreamUseCase;
  AppColors? _colors;
  StreamSubscription? _subscription;
  AppThemeType? _type;

  AppColors get colors => _colors ?? const LightThemeAppColors();

  void _init() {
    _updateColors(_getSystemTheme);
    _listenToAppThemeTypeChanges();
    _listenToPlatformBrightnessChanges();
  }

  void _listenToPlatformBrightnessChanges() {
    PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
      if (_type == AppThemeType.system) {
        _updateColors(_getSystemTheme);
      }
    };
  }

  void _listenToAppThemeTypeChanges() {
    _subscription =
        _getAppThemeTypeStreamUseCase().listen(_onAppThemeTypeChange);
  }

  void _onAppThemeTypeChange(AppThemeType type) {
    _type = type;
    _updateColors(_getAppColorsByType(type));
  }

  void _updateColors(AppColors newColors) {
    _colors = newColors;
    notifyListeners();
    SystemChrome.setSystemUIOverlayStyle(_colors!.systemUiOverlayStyle);
  }

  AppColors _getAppColorsByType(AppThemeType type) {
    switch (type) {
      case AppThemeType.system:
        return _getSystemTheme;
      case AppThemeType.light:
        return const LightThemeAppColors();
      case AppThemeType.dark:
        return const DarkThemeAppColors();
    }
  }

  AppColors get _getSystemTheme {
    if (PlatformDispatcher.instance.platformBrightness.isDark) {
      return const DarkThemeAppColors();
    } else {
      return const LightThemeAppColors();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }
}

class LightAppColorsProvider extends AppColorsProvider {
  LightAppColorsProvider(super.getAppThemeTypeStream);

  @override
  AppColors get colors => const LightThemeAppColors();
}

class DarkAppColorsProvider extends AppColorsProvider {
  DarkAppColorsProvider(super.getAppThemeTypeStream);

  @override
  AppColors get colors => const DarkThemeAppColors();
}

//AppColorsProvider implementation for constant light theme
class ConstantLightAppColorsProvider extends AppColorsProvider {
  ConstantLightAppColorsProvider(super.getAppThemeTypeStream);

  @override
  AppColors get colors => const LightThemeAppColors();

  @override
  void _init() {}

  @override
  void _listenToPlatformBrightnessChanges() {
    return;
  }

  @override
  void _listenToAppThemeTypeChanges() {
    return;
  }

  @override
  void _onAppThemeTypeChange(AppThemeType type) {
    return;
  }

  @override
  void _updateColors(AppColors newColors) {
    return;
  }

  @override
  AppColors _getAppColorsByType(AppThemeType type) {
    return const LightThemeAppColors();
  }

  @override
  AppColors get _getSystemTheme {
    return const LightThemeAppColors();
  }
}
