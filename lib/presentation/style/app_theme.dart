import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';


@tailorComponent
class _$AppBarThemeColor {
  static List<Color> background = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];
}

@tailorComponent
class _$BackgroundColor {
  static List<Color> background = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];
}

@tailorComponent
class _$ButtonStyleColor {
  static List<Color> background = [const Color(0xFFFF6500), const Color(0xFFFF6500)];
  static List<Color> inactive = [const Color(0xFFFFD1B3), const Color(0xFF3D3D43)];
  static List<Color> buttonText = [const Color(0xFFFFFFFF), const Color(0xFFFFFFFF)];
  static List<Color> buttonInactiveText = [const Color(0xFFFFFFFF), const Color(0xFF525258)];
}

@tailorComponent
class _$ElevateButtonColor {
  static List<Color> elevatedBackground = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];
  static List<Color> elevatedSelectedBackground = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];

  static List<Color> elevatedText = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
  static List<Color> elevatedSelectedText = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];

  static List<Color> elevatedBorder = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
  static List<Color> elevatedSelectedBorder = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
}

@tailorComponent
class _$TextColor {
  static List<Color> color = [const Color(0xFFFF6500), const Color(0xFFFFFFFF)];
}

@tailorComponent
class _$IconColor {
  static List<Color> color = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
  static List<Color> orange = [const Color(0xFFFF6500), const Color(0xFFFF6500)];
}

@tailor
class _$AppTheme {
  @themeExtension
  static List<AppBarThemeColor> appBarTheme = [AppBarThemeColor.light, AppBarThemeColor.dark];
  @themeExtension
  static List<BackgroundColor> backgroundColor = [BackgroundColor.light, BackgroundColor.dark];
  @themeExtension
  static List<ButtonStyleColor> button = [ButtonStyleColor.light, ButtonStyleColor.dark];
  @themeExtension
  static List<ElevateButtonColor> elevateButtonStyle1 = [ElevateButtonColor.light, ElevateButtonColor.dark];
  @themeExtension
  static List<TextColor> text = [TextColor.light, TextColor.dark];
  @themeExtension
  static List<IconColor> icon = [IconColor.light, IconColor.dark];
}