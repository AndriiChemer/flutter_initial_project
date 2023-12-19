// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AppBarThemeColor extends ThemeExtension<AppBarThemeColor> {
  const AppBarThemeColor({
    required this.background,
  });

  final Color background;

  static final AppBarThemeColor light = AppBarThemeColor(
    background: _$AppBarThemeColor.background[0],
  );

  static final AppBarThemeColor dark = AppBarThemeColor(
    background: _$AppBarThemeColor.background[1],
  );

  static final themes = [
    light,
    dark,
  ];

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

class BackgroundColor extends ThemeExtension<BackgroundColor> {
  const BackgroundColor({
    required this.background,
  });

  final Color background;

  static final BackgroundColor light = BackgroundColor(
    background: _$BackgroundColor.background[0],
  );

  static final BackgroundColor dark = BackgroundColor(
    background: _$BackgroundColor.background[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  BackgroundColor copyWith({
    Color? background,
  }) {
    return BackgroundColor(
      background: background ?? this.background,
    );
  }

  @override
  BackgroundColor lerp(
      covariant ThemeExtension<BackgroundColor>? other, double t) {
    if (other is! BackgroundColor) return this as BackgroundColor;
    return BackgroundColor(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackgroundColor &&
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

class ButtonStyleColor extends ThemeExtension<ButtonStyleColor> {
  const ButtonStyleColor({
    required this.background,
    required this.buttonInactiveText,
    required this.buttonText,
    required this.inactive,
  });

  final Color background;
  final Color buttonInactiveText;
  final Color buttonText;
  final Color inactive;

  static final ButtonStyleColor light = ButtonStyleColor(
    background: _$ButtonStyleColor.background[0],
    buttonInactiveText: _$ButtonStyleColor.buttonInactiveText[0],
    buttonText: _$ButtonStyleColor.buttonText[0],
    inactive: _$ButtonStyleColor.inactive[0],
  );

  static final ButtonStyleColor dark = ButtonStyleColor(
    background: _$ButtonStyleColor.background[1],
    buttonInactiveText: _$ButtonStyleColor.buttonInactiveText[1],
    buttonText: _$ButtonStyleColor.buttonText[1],
    inactive: _$ButtonStyleColor.inactive[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ButtonStyleColor copyWith({
    Color? background,
    Color? buttonInactiveText,
    Color? buttonText,
    Color? inactive,
  }) {
    return ButtonStyleColor(
      background: background ?? this.background,
      buttonInactiveText: buttonInactiveText ?? this.buttonInactiveText,
      buttonText: buttonText ?? this.buttonText,
      inactive: inactive ?? this.inactive,
    );
  }

  @override
  ButtonStyleColor lerp(
      covariant ThemeExtension<ButtonStyleColor>? other, double t) {
    if (other is! ButtonStyleColor) return this as ButtonStyleColor;
    return ButtonStyleColor(
      background: Color.lerp(background, other.background, t)!,
      buttonInactiveText:
          Color.lerp(buttonInactiveText, other.buttonInactiveText, t)!,
      buttonText: Color.lerp(buttonText, other.buttonText, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ButtonStyleColor &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(buttonInactiveText, other.buttonInactiveText) &&
            const DeepCollectionEquality()
                .equals(buttonText, other.buttonText) &&
            const DeepCollectionEquality().equals(inactive, other.inactive));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(buttonInactiveText),
      const DeepCollectionEquality().hash(buttonText),
      const DeepCollectionEquality().hash(inactive),
    );
  }
}

class ElevateButtonColor extends ThemeExtension<ElevateButtonColor> {
  const ElevateButtonColor({
    required this.elevatedBackground,
    required this.elevatedBorder,
    required this.elevatedSelectedBackground,
    required this.elevatedSelectedBorder,
    required this.elevatedSelectedText,
    required this.elevatedText,
  });

  final Color elevatedBackground;
  final Color elevatedBorder;
  final Color elevatedSelectedBackground;
  final Color elevatedSelectedBorder;
  final Color elevatedSelectedText;
  final Color elevatedText;

  static final ElevateButtonColor light = ElevateButtonColor(
    elevatedBackground: _$ElevateButtonColor.elevatedBackground[0],
    elevatedBorder: _$ElevateButtonColor.elevatedBorder[0],
    elevatedSelectedBackground:
        _$ElevateButtonColor.elevatedSelectedBackground[0],
    elevatedSelectedBorder: _$ElevateButtonColor.elevatedSelectedBorder[0],
    elevatedSelectedText: _$ElevateButtonColor.elevatedSelectedText[0],
    elevatedText: _$ElevateButtonColor.elevatedText[0],
  );

  static final ElevateButtonColor dark = ElevateButtonColor(
    elevatedBackground: _$ElevateButtonColor.elevatedBackground[1],
    elevatedBorder: _$ElevateButtonColor.elevatedBorder[1],
    elevatedSelectedBackground:
        _$ElevateButtonColor.elevatedSelectedBackground[1],
    elevatedSelectedBorder: _$ElevateButtonColor.elevatedSelectedBorder[1],
    elevatedSelectedText: _$ElevateButtonColor.elevatedSelectedText[1],
    elevatedText: _$ElevateButtonColor.elevatedText[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ElevateButtonColor copyWith({
    Color? elevatedBackground,
    Color? elevatedBorder,
    Color? elevatedSelectedBackground,
    Color? elevatedSelectedBorder,
    Color? elevatedSelectedText,
    Color? elevatedText,
  }) {
    return ElevateButtonColor(
      elevatedBackground: elevatedBackground ?? this.elevatedBackground,
      elevatedBorder: elevatedBorder ?? this.elevatedBorder,
      elevatedSelectedBackground:
          elevatedSelectedBackground ?? this.elevatedSelectedBackground,
      elevatedSelectedBorder:
          elevatedSelectedBorder ?? this.elevatedSelectedBorder,
      elevatedSelectedText: elevatedSelectedText ?? this.elevatedSelectedText,
      elevatedText: elevatedText ?? this.elevatedText,
    );
  }

  @override
  ElevateButtonColor lerp(
      covariant ThemeExtension<ElevateButtonColor>? other, double t) {
    if (other is! ElevateButtonColor) return this as ElevateButtonColor;
    return ElevateButtonColor(
      elevatedBackground:
          Color.lerp(elevatedBackground, other.elevatedBackground, t)!,
      elevatedBorder: Color.lerp(elevatedBorder, other.elevatedBorder, t)!,
      elevatedSelectedBackground: Color.lerp(
          elevatedSelectedBackground, other.elevatedSelectedBackground, t)!,
      elevatedSelectedBorder:
          Color.lerp(elevatedSelectedBorder, other.elevatedSelectedBorder, t)!,
      elevatedSelectedText:
          Color.lerp(elevatedSelectedText, other.elevatedSelectedText, t)!,
      elevatedText: Color.lerp(elevatedText, other.elevatedText, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElevateButtonColor &&
            const DeepCollectionEquality()
                .equals(elevatedBackground, other.elevatedBackground) &&
            const DeepCollectionEquality()
                .equals(elevatedBorder, other.elevatedBorder) &&
            const DeepCollectionEquality().equals(
                elevatedSelectedBackground, other.elevatedSelectedBackground) &&
            const DeepCollectionEquality()
                .equals(elevatedSelectedBorder, other.elevatedSelectedBorder) &&
            const DeepCollectionEquality()
                .equals(elevatedSelectedText, other.elevatedSelectedText) &&
            const DeepCollectionEquality()
                .equals(elevatedText, other.elevatedText));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(elevatedBackground),
      const DeepCollectionEquality().hash(elevatedBorder),
      const DeepCollectionEquality().hash(elevatedSelectedBackground),
      const DeepCollectionEquality().hash(elevatedSelectedBorder),
      const DeepCollectionEquality().hash(elevatedSelectedText),
      const DeepCollectionEquality().hash(elevatedText),
    );
  }
}

class TextColor extends ThemeExtension<TextColor> {
  const TextColor({
    required this.color,
  });

  final Color color;

  static final TextColor light = TextColor(
    color: _$TextColor.color[0],
  );

  static final TextColor dark = TextColor(
    color: _$TextColor.color[1],
  );

  static final themes = [
    light,
    dark,
  ];

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

class IconColor extends ThemeExtension<IconColor> {
  const IconColor({
    required this.color,
    required this.orange,
  });

  final Color color;
  final Color orange;

  static final IconColor light = IconColor(
    color: _$IconColor.color[0],
    orange: _$IconColor.orange[0],
  );

  static final IconColor dark = IconColor(
    color: _$IconColor.color[1],
    orange: _$IconColor.orange[1],
  );

  static final themes = [
    light,
    dark,
  ];

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

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.appBarTheme,
    required this.backgroundColor,
    required this.button,
    required this.elevateButtonStyle1,
    required this.icon,
    required this.text,
  });

  final AppBarThemeColor appBarTheme;
  final BackgroundColor backgroundColor;
  final ButtonStyleColor button;
  final ElevateButtonColor elevateButtonStyle1;
  final IconColor icon;
  final TextColor text;

  static final AppTheme light = AppTheme(
    appBarTheme: _$AppTheme.appBarTheme[0],
    backgroundColor: _$AppTheme.backgroundColor[0],
    button: _$AppTheme.button[0],
    elevateButtonStyle1: _$AppTheme.elevateButtonStyle1[0],
    icon: _$AppTheme.icon[0],
    text: _$AppTheme.text[0],
  );

  static final AppTheme dark = AppTheme(
    appBarTheme: _$AppTheme.appBarTheme[1],
    backgroundColor: _$AppTheme.backgroundColor[1],
    button: _$AppTheme.button[1],
    elevateButtonStyle1: _$AppTheme.elevateButtonStyle1[1],
    icon: _$AppTheme.icon[1],
    text: _$AppTheme.text[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppTheme copyWith({
    AppBarThemeColor? appBarTheme,
    BackgroundColor? backgroundColor,
    ButtonStyleColor? button,
    ElevateButtonColor? elevateButtonStyle1,
    IconColor? icon,
    TextColor? text,
  }) {
    return AppTheme(
      appBarTheme: appBarTheme ?? this.appBarTheme,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      button: button ?? this.button,
      elevateButtonStyle1: elevateButtonStyle1 ?? this.elevateButtonStyle1,
      icon: icon ?? this.icon,
      text: text ?? this.text,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      appBarTheme: appBarTheme.lerp(other.appBarTheme, t) as AppBarThemeColor,
      backgroundColor:
          backgroundColor.lerp(other.backgroundColor, t) as BackgroundColor,
      button: button.lerp(other.button, t) as ButtonStyleColor,
      elevateButtonStyle1: elevateButtonStyle1.lerp(
          other.elevateButtonStyle1, t) as ElevateButtonColor,
      icon: icon.lerp(other.icon, t) as IconColor,
      text: text.lerp(other.text, t) as TextColor,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality()
                .equals(appBarTheme, other.appBarTheme) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(button, other.button) &&
            const DeepCollectionEquality()
                .equals(elevateButtonStyle1, other.elevateButtonStyle1) &&
            const DeepCollectionEquality().equals(icon, other.icon) &&
            const DeepCollectionEquality().equals(text, other.text));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(appBarTheme),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(button),
      const DeepCollectionEquality().hash(elevateButtonStyle1),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(text),
    );
  }
}

extension AppThemeBuildContextProps on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  AppBarThemeColor get appBarTheme => appTheme.appBarTheme;
  BackgroundColor get backgroundColor => appTheme.backgroundColor;
  ButtonStyleColor get button => appTheme.button;
  ElevateButtonColor get elevateButtonStyle1 => appTheme.elevateButtonStyle1;
  IconColor get icon => appTheme.icon;
  TextColor get text => appTheme.text;
}
