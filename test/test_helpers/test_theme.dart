import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';
import 'package:mockito/mockito.dart';

import '../presentation/page/settings/settings_page_cubit_test.mocks.dart';

ThemeData getAppTheme([AppColors colors = const LightThemeAppColors()]) {
  return ThemeData(
    extensions: [AppTheme.light],
    scaffoldBackgroundColor: colors.background,
    brightness: colors.brightness,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colors.primary,
      selectionHandleColor: colors.primary,
      selectionColor: colors.primary.withOpacity(0.2),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(primaryColor: colors.primary),
    colorScheme: ColorScheme.light(
      secondary: colors.primary,
      brightness: colors.brightness,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: colors.typo, // Set the color for selected icon
      unselectedItemColor: colors.typo, // Set the color for unselected icons
    ),
  );
}

MockGetAppThemeTypeStreamUseCase mockGetAppThemeTypeStream() {
  final mockGetAppThemeTypeStreamUseCase = MockGetAppThemeTypeStreamUseCase();

  when(mockGetAppThemeTypeStreamUseCase.call())
      .thenAnswer((_) => Stream.value(AppThemeType.light));

  return mockGetAppThemeTypeStreamUseCase;
}
