import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';


@tailorComponent
class _$AppBarTheme {
  static List<Color> background = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];
}

@tailorComponent
class _$Background {
  static List<Color> background = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];
}

@tailorComponent
class _$ButtonStyle {
  static List<Color> background = [const Color(0xFFFF6500), const Color(0xFFFF6500)];
  static List<Color> inactive = [const Color(0xFFFFD1B3), const Color(0xFF3D3D43)];
  static List<Color> buttonText = [const Color(0xFFFFFFFF), const Color(0xFFFFFFFF)];
  static List<Color> buttonInactiveText = [const Color(0xFFFFFFFF), const Color(0xFF525258)];
}

@tailorComponent
class _$ElevateButton {
  static List<Color> elevatedBackground = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];
  static List<Color> elevatedSelectedBackground = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];

  static List<Color> elevatedText = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
  static List<Color> elevatedSelectedText = [const Color(0xFFFFFFFF), const Color(0xFF27272E)];

  static List<Color> elevatedBorder = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
  static List<Color> elevatedSelectedBorder = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
}

@tailorComponent
class _$Text {
  static List<Color> color = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
}

@tailorComponent
class _$Icon {
  static List<Color> color = [const Color(0xFF27272E), const Color(0xFFFFFFFF)];
  static List<Color> orange = [const Color(0xFFFF6500), const Color(0xFFFF6500)];
}

@tailor
class _$AppTheme {
  @themeExtension
  static List<AppBarTheme> appBarTheme = [AppBarTheme.light, AppBarTheme.dark];
  @themeExtension
  static List<Background> backgroundColor = [Background.light, Background.dark];
  @themeExtension
  static List<ButtonStyle> button = [ButtonStyle.light, ButtonStyle.dark];
  @themeExtension
  static List<ElevateButton> elevateButtonStyle1 = [ElevateButton.light, ElevateButton.dark];
  @themeExtension
  static List<Text> text = [Text.light, Text.dark];
  @themeExtension
  static List<Icon> icon = [Icon.light, Icon.dark];
}