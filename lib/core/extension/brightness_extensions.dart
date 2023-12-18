import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BrightnessExt on Brightness {
  bool get isDark => this == Brightness.dark;

  /// For dark -> white text systemUIOverlayStyle
  SystemUiOverlayStyle get contrastUiOverlayStyle {
    return isDark ? _lightSystemOverlayStyle : _darkSystemUiOverlayStyle;
  }

  /// For dark -> black text systemUIOverlayStyle
  SystemUiOverlayStyle get matchingUiOverlayStyle {
    return isDark ? _darkSystemUiOverlayStyle : _lightSystemOverlayStyle;
  }

  SystemUiOverlayStyle get darkUiOverlayStyle => _darkSystemUiOverlayStyle;
}

const _lightSystemOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

const _darkSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);
