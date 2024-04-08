// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppBarThemeColorTailorMixin on ThemeExtension<AppBarThemeColor> {
  Color get background;

  @override
  AppBarThemeColor copyWith({
    Color? background,
  }) {
    return AppBarThemeColor(
      background: background ?? this.background,
    );
  }

  @override
  AppBarThemeColor lerp(
      covariant ThemeExtension<AppBarThemeColor>? other, double t) {
    if (other is! AppBarThemeColor) return this as AppBarThemeColor;
    return AppBarThemeColor(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppBarThemeColor &&
            const DeepCollectionEquality()
                .equals(background, other.background));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
    );
  }
}

mixin _$ButtonStyleColorTailorMixin on ThemeExtension<ButtonStyleColor> {
  Color get background;
  Color get inactive;
  Color get buttonText;
  Color get buttonInactiveText;

  @override
  ButtonStyleColor copyWith({
    Color? background,
    Color? inactive,
    Color? buttonText,
    Color? buttonInactiveText,
  }) {
    return ButtonStyleColor(
      background: background ?? this.background,
      inactive: inactive ?? this.inactive,
      buttonText: buttonText ?? this.buttonText,
      buttonInactiveText: buttonInactiveText ?? this.buttonInactiveText,
    );
  }

  @override
  ButtonStyleColor lerp(
      covariant ThemeExtension<ButtonStyleColor>? other, double t) {
    if (other is! ButtonStyleColor) return this as ButtonStyleColor;
    return ButtonStyleColor(
      background: Color.lerp(background, other.background, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      buttonText: Color.lerp(buttonText, other.buttonText, t)!,
      buttonInactiveText:
          Color.lerp(buttonInactiveText, other.buttonInactiveText, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ButtonStyleColor &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality().equals(inactive, other.inactive) &&
            const DeepCollectionEquality()
                .equals(buttonText, other.buttonText) &&
            const DeepCollectionEquality()
                .equals(buttonInactiveText, other.buttonInactiveText));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(inactive),
      const DeepCollectionEquality().hash(buttonText),
      const DeepCollectionEquality().hash(buttonInactiveText),
    );
  }
}

mixin _$ElevateButtonColorTailorMixin on ThemeExtension<ElevateButtonColor> {
  Color get elevatedBackground;
  Color get elevatedSelectedBackground;
  Color get elevatedText;
  Color get elevatedSelectedText;
  Color get elevatedBorder;
  Color get elevatedSelectedBorder;

  @override
  ElevateButtonColor copyWith({
    Color? elevatedBackground,
    Color? elevatedSelectedBackground,
    Color? elevatedText,
    Color? elevatedSelectedText,
    Color? elevatedBorder,
    Color? elevatedSelectedBorder,
  }) {
    return ElevateButtonColor(
      elevatedBackground: elevatedBackground ?? this.elevatedBackground,
      elevatedSelectedBackground:
          elevatedSelectedBackground ?? this.elevatedSelectedBackground,
      elevatedText: elevatedText ?? this.elevatedText,
      elevatedSelectedText: elevatedSelectedText ?? this.elevatedSelectedText,
      elevatedBorder: elevatedBorder ?? this.elevatedBorder,
      elevatedSelectedBorder:
          elevatedSelectedBorder ?? this.elevatedSelectedBorder,
    );
  }

  @override
  ElevateButtonColor lerp(
      covariant ThemeExtension<ElevateButtonColor>? other, double t) {
    if (other is! ElevateButtonColor) return this as ElevateButtonColor;
    return ElevateButtonColor(
      elevatedBackground:
          Color.lerp(elevatedBackground, other.elevatedBackground, t)!,
      elevatedSelectedBackground: Color.lerp(
          elevatedSelectedBackground, other.elevatedSelectedBackground, t)!,
      elevatedText: Color.lerp(elevatedText, other.elevatedText, t)!,
      elevatedSelectedText:
          Color.lerp(elevatedSelectedText, other.elevatedSelectedText, t)!,
      elevatedBorder: Color.lerp(elevatedBorder, other.elevatedBorder, t)!,
      elevatedSelectedBorder:
          Color.lerp(elevatedSelectedBorder, other.elevatedSelectedBorder, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElevateButtonColor &&
            const DeepCollectionEquality()
                .equals(elevatedBackground, other.elevatedBackground) &&
            const DeepCollectionEquality().equals(
                elevatedSelectedBackground, other.elevatedSelectedBackground) &&
            const DeepCollectionEquality()
                .equals(elevatedText, other.elevatedText) &&
            const DeepCollectionEquality()
                .equals(elevatedSelectedText, other.elevatedSelectedText) &&
            const DeepCollectionEquality()
                .equals(elevatedBorder, other.elevatedBorder) &&
            const DeepCollectionEquality()
                .equals(elevatedSelectedBorder, other.elevatedSelectedBorder));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(elevatedBackground),
      const DeepCollectionEquality().hash(elevatedSelectedBackground),
      const DeepCollectionEquality().hash(elevatedText),
      const DeepCollectionEquality().hash(elevatedSelectedText),
      const DeepCollectionEquality().hash(elevatedBorder),
      const DeepCollectionEquality().hash(elevatedSelectedBorder),
    );
  }
}

mixin _$TextColorTailorMixin on ThemeExtension<TextColor> {
  Color get color;

  @override
  TextColor copyWith({
    Color? color,
  }) {
    return TextColor(
      color: color ?? this.color,
    );
  }

  @override
  TextColor lerp(covariant ThemeExtension<TextColor>? other, double t) {
    if (other is! TextColor) return this as TextColor;
    return TextColor(
      color: Color.lerp(color, other.color, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextColor &&
            const DeepCollectionEquality().equals(color, other.color));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
    );
  }
}

mixin _$IconColorTailorMixin on ThemeExtension<IconColor> {
  Color get color;
  Color get orange;

  @override
  IconColor copyWith({
    Color? color,
    Color? orange,
  }) {
    return IconColor(
      color: color ?? this.color,
      orange: orange ?? this.orange,
    );
  }

  @override
  IconColor lerp(covariant ThemeExtension<IconColor>? other, double t) {
    if (other is! IconColor) return this as IconColor;
    return IconColor(
      color: Color.lerp(color, other.color, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IconColor &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality().equals(orange, other.orange));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(orange),
    );
  }
}

mixin _$BottomNavigationTailorMixin on ThemeExtension<BottomNavigation> {
  Color get background;
  Color get activeItemColor;
  Color get unselectedItemColor;

  @override
  BottomNavigation copyWith({
    Color? background,
    Color? activeItemColor,
    Color? unselectedItemColor,
  }) {
    return BottomNavigation(
      background: background ?? this.background,
      activeItemColor: activeItemColor ?? this.activeItemColor,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
    );
  }

  @override
  BottomNavigation lerp(
      covariant ThemeExtension<BottomNavigation>? other, double t) {
    if (other is! BottomNavigation) return this as BottomNavigation;
    return BottomNavigation(
      background: Color.lerp(background, other.background, t)!,
      activeItemColor: Color.lerp(activeItemColor, other.activeItemColor, t)!,
      unselectedItemColor:
          Color.lerp(unselectedItemColor, other.unselectedItemColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BottomNavigation &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(activeItemColor, other.activeItemColor) &&
            const DeepCollectionEquality()
                .equals(unselectedItemColor, other.unselectedItemColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(activeItemColor),
      const DeepCollectionEquality().hash(unselectedItemColor),
    );
  }
}

mixin _$AppThemeTailorMixin on ThemeExtension<AppTheme> {
  Color get background;
  AppBarThemeColor get appBarThemeColor;
  ButtonStyleColor get buttonTheme;
  ElevateButtonColor get elevateButtonTheme;
  TextColor get textColorTheme;
  IconColor get iconColorTheme;
  BottomNavigation get bottomNavigation;

  @override
  AppTheme copyWith({
    Color? background,
    AppBarThemeColor? appBarThemeColor,
    ButtonStyleColor? buttonTheme,
    ElevateButtonColor? elevateButtonTheme,
    TextColor? textColorTheme,
    IconColor? iconColorTheme,
    BottomNavigation? bottomNavigation,
  }) {
    return AppTheme(
      background: background ?? this.background,
      appBarThemeColor: appBarThemeColor ?? this.appBarThemeColor,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      elevateButtonTheme: elevateButtonTheme ?? this.elevateButtonTheme,
      textColorTheme: textColorTheme ?? this.textColorTheme,
      iconColorTheme: iconColorTheme ?? this.iconColorTheme,
      bottomNavigation: bottomNavigation ?? this.bottomNavigation,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      background: Color.lerp(background, other.background, t)!,
      appBarThemeColor:
          appBarThemeColor.lerp(other.appBarThemeColor, t) as AppBarThemeColor,
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t) as ButtonStyleColor,
      elevateButtonTheme: elevateButtonTheme.lerp(other.elevateButtonTheme, t)
          as ElevateButtonColor,
      textColorTheme: textColorTheme.lerp(other.textColorTheme, t) as TextColor,
      iconColorTheme: iconColorTheme.lerp(other.iconColorTheme, t) as IconColor,
      bottomNavigation:
          bottomNavigation.lerp(other.bottomNavigation, t) as BottomNavigation,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(appBarThemeColor, other.appBarThemeColor) &&
            const DeepCollectionEquality()
                .equals(buttonTheme, other.buttonTheme) &&
            const DeepCollectionEquality()
                .equals(elevateButtonTheme, other.elevateButtonTheme) &&
            const DeepCollectionEquality()
                .equals(textColorTheme, other.textColorTheme) &&
            const DeepCollectionEquality()
                .equals(iconColorTheme, other.iconColorTheme) &&
            const DeepCollectionEquality()
                .equals(bottomNavigation, other.bottomNavigation));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(appBarThemeColor),
      const DeepCollectionEquality().hash(buttonTheme),
      const DeepCollectionEquality().hash(elevateButtonTheme),
      const DeepCollectionEquality().hash(textColorTheme),
      const DeepCollectionEquality().hash(iconColorTheme),
      const DeepCollectionEquality().hash(bottomNavigation),
    );
  }
}

extension AppThemeBuildContext on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
