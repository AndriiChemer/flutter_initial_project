import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppColors {
  const AppColors({
    required this.background,
    required this.primary,
    required this.typo,
    required this.text,
    required this.error,
    required this.subtypo,
    required this.border,
    required this.systemUiOverlayStyle,
    required this.overlay,
    required this.brightness,
    required this.aboveShadow,
    required this.border_50,
    required this.tile,
  });

  final Color background;
  final Color primary;
  final Color typo;
  final Color border;
  final Color border_50;
  final Color subtypo;
  final Color text;
  final Color overlay;
  final Color aboveShadow;
  final Color error;
  final Color tile;

  final SystemUiOverlayStyle systemUiOverlayStyle;
  final Brightness brightness;

  Color get transparent => Colors.transparent;
}

class LightThemeAppColors extends AppColors {
  const LightThemeAppColors() : super(
    error: Colors.red,
    typo: const Color.fromARGB(255, 64, 64, 65),
    subtypo: const Color.fromARGB(255, 146, 148, 151),
    text: const Color.fromARGB(115, 0, 0, 0),
    systemUiOverlayStyle: SystemUiOverlayStyle.dark,
    brightness: Brightness.light,
    border: const Color.fromARGB(255, 218, 218, 218),
    border_50: const Color.fromARGB(128, 218, 218, 218),
    overlay: const Color.fromARGB(115, 0, 0, 0),
    aboveShadow: const Color.fromRGBO(0, 0, 0, 0.05),
    background: const Color.fromARGB(255, 242, 242, 242),
    primary: const Color.fromARGB(255, 255, 205, 0),
    tile: const Color.fromARGB(255, 255, 255, 255),
  );
}

class DarkThemeAppColors extends AppColors {
  const DarkThemeAppColors() : super(
    error: Colors.red,
    typo: const Color.fromARGB(255, 242, 242, 242),
    subtypo: const Color.fromARGB(255, 146, 148, 151),
    text: const Color.fromARGB(255, 242, 242, 242),
    systemUiOverlayStyle: SystemUiOverlayStyle.light,
    brightness: Brightness.dark,
    border: const Color.fromARGB(255, 89, 89, 89),
    border_50: const Color.fromARGB(128, 89, 89, 89),
    overlay: const Color.fromARGB(115, 0, 0, 0),
    aboveShadow: const Color.fromRGBO(0, 0, 0, 0.25),
    background: const Color.fromARGB(255, 89, 89, 89), //const Color.fromRGBO(0, 0, 0, 0.25),
    primary: const Color.fromARGB(255, 255, 205, 0),
    tile: const Color.fromARGB(255, 38, 38, 40),
  );
}
