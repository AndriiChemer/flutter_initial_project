import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

import 'test_theme.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeAnimationDuration: Duration.zero,
      themeMode: ThemeMode.system,
      theme: getAppTheme(isDarkTheme ? const DarkThemeAppColors() : const LightThemeAppColors()),
      darkTheme: getAppTheme(const DarkThemeAppColors()),
      home: child,
    );
  }
}
