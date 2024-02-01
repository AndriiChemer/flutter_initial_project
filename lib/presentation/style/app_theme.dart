// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';


@tailorMixinComponent
class AppBarThemeColor extends ThemeExtension<AppBarThemeColor> with _$AppBarThemeColorTailorMixin {
  AppBarThemeColor({required this.background});

  static final light = AppBarThemeColor(background: const Color(0xFFFFFFFF));
  static final dark = AppBarThemeColor(background: const Color(0xFF27272E));

  final Color background;
}

@tailorMixinComponent
class ButtonStyleColor extends ThemeExtension<ButtonStyleColor> with _$ButtonStyleColorTailorMixin {
  ButtonStyleColor({
    required this.background,
    required this.inactive,
    required this.buttonText,
    required this.buttonInactiveText,
  });

  static final light = ButtonStyleColor(
    background: const Color(0xFFFF6500),
    inactive: const Color(0xFFFFD1B3),
    buttonText: const Color(0xFFFFFFFF),
    buttonInactiveText: const Color(0xFFFFFFFF),
  );

  static final dark = ButtonStyleColor(
    background: const Color(0xFFFF6500),
    inactive: const Color(0xFF3D3D43),
    buttonText: const Color(0xFFFFFFFF),
    buttonInactiveText: const Color(0xFF525258),
  );

  final Color background;
  final Color inactive;
  final Color buttonText;
  final Color buttonInactiveText;
}

@tailorMixinComponent
class ElevateButtonColor extends ThemeExtension<ElevateButtonColor> with _$ElevateButtonColorTailorMixin {
  ElevateButtonColor({
    required this.elevatedBackground,
    required this.elevatedSelectedBackground,
    required this.elevatedText,
    required this.elevatedSelectedText,
    required this.elevatedBorder,
    required this.elevatedSelectedBorder,
  });

  static final light = ElevateButtonColor(
    elevatedBackground: const Color(0xFFFFFFFF),
    elevatedSelectedBackground: const Color(0xFF27272E),
    elevatedText: const Color(0xFF27272E),
    elevatedSelectedText: const Color(0xFFFFFFFF),
    elevatedBorder: const Color(0xFF27272E),
    elevatedSelectedBorder: const Color(0xFF27272E),
  );

  static final dark = ElevateButtonColor(
    elevatedBackground: const Color(0xFF27272E),
    elevatedSelectedBackground: const Color(0xFFFFFFFF),
    elevatedText: const Color(0xFFFFFFFF),
    elevatedSelectedText: const Color(0xFF27272E),
    elevatedBorder: const Color(0xFFFFFFFF),
    elevatedSelectedBorder: const Color(0xFFFFFFFF),
  );

  final Color elevatedBackground;
  final Color elevatedSelectedBackground;
  final Color elevatedText;
  final Color elevatedSelectedText;
  final Color elevatedBorder;
  final Color elevatedSelectedBorder;
}

@tailorMixinComponent
class TextColor extends ThemeExtension<TextColor> with _$TextColorTailorMixin {
  TextColor({required this.color});

  static final light = TextColor(color: const Color(0xFFFF6500));

  static final dark = TextColor(color: const Color(0xFFFFFFFF));

  final Color color;
}

@tailorMixinComponent
class IconColor extends ThemeExtension<IconColor> with _$IconColorTailorMixin {
  IconColor({
    required this.color,
    required this.orange,
  });

  static final light = IconColor(
    color: const Color(0xFF27272E),
    orange: const Color(0xFFFF6500),
  );

  static final dark = IconColor(
    color: const Color(0xFFFFFFFF),
    orange: const Color(0xFFFF6500),
  );

  final Color color;
  final Color orange;
}

@TailorMixin(
  themeGetter: ThemeGetter.onBuildContext,
)
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  AppTheme({
    required this.appBarThemeColor,
    required this.background,
    required this.buttonTheme,
    required this.elevateButtonTheme,
    required this.textColorTheme,
    required this.iconColorTheme,
  });

  final Color background;
  @themeExtension
  final AppBarThemeColor appBarThemeColor;
  @themeExtension
  final ButtonStyleColor buttonTheme;
  @themeExtension
  final ElevateButtonColor elevateButtonTheme;
  @themeExtension
  final TextColor textColorTheme;
  @themeExtension
  final IconColor iconColorTheme;

  static final light = AppTheme(
    background: const Color(0xFFFFFFFF),
    appBarThemeColor: AppBarThemeColor.light,
    buttonTheme: ButtonStyleColor.light,
    elevateButtonTheme: ElevateButtonColor.light,
    textColorTheme: TextColor.light,
    iconColorTheme: IconColor.light,
  );

  static final dark = AppTheme(
    background: const Color(0xFF27272E),
    appBarThemeColor: AppBarThemeColor.dark,
    buttonTheme: ButtonStyleColor.dark,
    elevateButtonTheme: ElevateButtonColor.dark,
    textColorTheme: TextColor.dark,
    iconColorTheme: IconColor.dark,
  );
}
