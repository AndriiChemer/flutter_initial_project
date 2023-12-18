// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AppBarTheme extends ThemeExtension<AppBarTheme> {
  const AppBarTheme({
    required this.background,
  });

  final Color background;

  static final AppBarTheme light = AppBarTheme(
    background: _$AppBarTheme.background[0],
  );

  static final AppBarTheme dark = AppBarTheme(
    background: _$AppBarTheme.background[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppBarTheme copyWith({
    Color? background,
  }) {
    return AppBarTheme(
      background: background ?? this.background,
    );
  }

  @override
  AppBarTheme lerp(covariant ThemeExtension<AppBarTheme>? other, double t) {
    if (other is! AppBarTheme) return this as AppBarTheme;
    return AppBarTheme(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppBarTheme &&
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

class Background extends ThemeExtension<Background> {
  const Background({
    required this.background,
  });

  final Color background;

  static final Background light = Background(
    background: _$Background.background[0],
  );

  static final Background dark = Background(
    background: _$Background.background[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  Background copyWith({
    Color? background,
  }) {
    return Background(
      background: background ?? this.background,
    );
  }

  @override
  Background lerp(covariant ThemeExtension<Background>? other, double t) {
    if (other is! Background) return this as Background;
    return Background(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Background &&
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

class ButtonStyle extends ThemeExtension<ButtonStyle> {
  const ButtonStyle({
    required this.background,
    required this.buttonInactiveText,
    required this.buttonText,
    required this.inactive,
  });

  final Color background;
  final Color buttonInactiveText;
  final Color buttonText;
  final Color inactive;

  static final ButtonStyle light = ButtonStyle(
    background: _$ButtonStyle.background[0],
    buttonInactiveText: _$ButtonStyle.buttonInactiveText[0],
    buttonText: _$ButtonStyle.buttonText[0],
    inactive: _$ButtonStyle.inactive[0],
  );

  static final ButtonStyle dark = ButtonStyle(
    background: _$ButtonStyle.background[1],
    buttonInactiveText: _$ButtonStyle.buttonInactiveText[1],
    buttonText: _$ButtonStyle.buttonText[1],
    inactive: _$ButtonStyle.inactive[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ButtonStyle copyWith({
    Color? background,
    Color? buttonInactiveText,
    Color? buttonText,
    Color? inactive,
  }) {
    return ButtonStyle(
      background: background ?? this.background,
      buttonInactiveText: buttonInactiveText ?? this.buttonInactiveText,
      buttonText: buttonText ?? this.buttonText,
      inactive: inactive ?? this.inactive,
    );
  }

  @override
  ButtonStyle lerp(covariant ThemeExtension<ButtonStyle>? other, double t) {
    if (other is! ButtonStyle) return this as ButtonStyle;
    return ButtonStyle(
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
            other is ButtonStyle &&
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

class ElevateButton extends ThemeExtension<ElevateButton> {
  const ElevateButton({
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

  static final ElevateButton light = ElevateButton(
    elevatedBackground: _$ElevateButton.elevatedBackground[0],
    elevatedBorder: _$ElevateButton.elevatedBorder[0],
    elevatedSelectedBackground: _$ElevateButton.elevatedSelectedBackground[0],
    elevatedSelectedBorder: _$ElevateButton.elevatedSelectedBorder[0],
    elevatedSelectedText: _$ElevateButton.elevatedSelectedText[0],
    elevatedText: _$ElevateButton.elevatedText[0],
  );

  static final ElevateButton dark = ElevateButton(
    elevatedBackground: _$ElevateButton.elevatedBackground[1],
    elevatedBorder: _$ElevateButton.elevatedBorder[1],
    elevatedSelectedBackground: _$ElevateButton.elevatedSelectedBackground[1],
    elevatedSelectedBorder: _$ElevateButton.elevatedSelectedBorder[1],
    elevatedSelectedText: _$ElevateButton.elevatedSelectedText[1],
    elevatedText: _$ElevateButton.elevatedText[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ElevateButton copyWith({
    Color? elevatedBackground,
    Color? elevatedBorder,
    Color? elevatedSelectedBackground,
    Color? elevatedSelectedBorder,
    Color? elevatedSelectedText,
    Color? elevatedText,
  }) {
    return ElevateButton(
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
  ElevateButton lerp(covariant ThemeExtension<ElevateButton>? other, double t) {
    if (other is! ElevateButton) return this as ElevateButton;
    return ElevateButton(
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
            other is ElevateButton &&
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

class Text extends ThemeExtension<Text> {
  const Text({
    required this.color,
  });

  final Color color;

  static final Text light = Text(
    color: _$Text.color[0],
  );

  static final Text dark = Text(
    color: _$Text.color[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  Text copyWith({
    Color? color,
  }) {
    return Text(
      color: color ?? this.color,
    );
  }

  @override
  Text lerp(covariant ThemeExtension<Text>? other, double t) {
    if (other is! Text) return this as Text;
    return Text(
      color: Color.lerp(color, other.color, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Text &&
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

class Icon extends ThemeExtension<Icon> {
  const Icon({
    required this.color,
    required this.orange,
  });

  final Color color;
  final Color orange;

  static final Icon light = Icon(
    color: _$Icon.color[0],
    orange: _$Icon.orange[0],
  );

  static final Icon dark = Icon(
    color: _$Icon.color[1],
    orange: _$Icon.orange[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  Icon copyWith({
    Color? color,
    Color? orange,
  }) {
    return Icon(
      color: color ?? this.color,
      orange: orange ?? this.orange,
    );
  }

  @override
  Icon lerp(covariant ThemeExtension<Icon>? other, double t) {
    if (other is! Icon) return this as Icon;
    return Icon(
      color: Color.lerp(color, other.color, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Icon &&
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

  final AppBarTheme appBarTheme;
  final Background backgroundColor;
  final ButtonStyle button;
  final ElevateButton elevateButtonStyle1;
  final Icon icon;
  final Text text;

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
    AppBarTheme? appBarTheme,
    Background? backgroundColor,
    ButtonStyle? button,
    ElevateButton? elevateButtonStyle1,
    Icon? icon,
    Text? text,
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
      appBarTheme: appBarTheme.lerp(other.appBarTheme, t) as AppBarTheme,
      backgroundColor:
          backgroundColor.lerp(other.backgroundColor, t) as Background,
      button: button.lerp(other.button, t) as ButtonStyle,
      elevateButtonStyle1: elevateButtonStyle1.lerp(
          other.elevateButtonStyle1, t) as ElevateButton,
      icon: icon.lerp(other.icon, t) as Icon,
      text: text.lerp(other.text, t) as Text,
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
  AppBarTheme get appBarTheme => appTheme.appBarTheme;
  Background get backgroundColor => appTheme.backgroundColor;
  ButtonStyle get button => appTheme.button;
  ElevateButton get elevateButtonStyle1 => appTheme.elevateButtonStyle1;
  Icon get icon => appTheme.icon;
  Text get text => appTheme.text;
}
