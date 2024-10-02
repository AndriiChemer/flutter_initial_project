import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:provider/provider.dart';

import 'test_theme.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    required this.child,
    required this.getAppThemeTypeStreamUseCase,
    required this.injector,
    super.key,
  });

  final Widget child;
  final GetAppThemeTypeStreamUseCase getAppThemeTypeStreamUseCase;
  final T Function<T extends Object>() Function() injector;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return HookedBlocConfigProvider(
      injector: injector,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppColorsProvider(
              getAppThemeTypeStreamUseCase,
            ),
          ),
          ProxyProvider<AppColorsProvider, AppTypo>(
            update: (_, value, __) => AppTypo(value.colors),
          ),
          ProxyProvider<AppColorsProvider, AppShadows>(
            update: (_, value, __) => AppShadows(value.colors),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeAnimationDuration: Duration.zero,
          themeMode: ThemeMode.system,
          theme: getAppTheme(isDarkTheme ? const DarkThemeAppColors() : const LightThemeAppColors()),
          darkTheme: getAppTheme(const DarkThemeAppColors()),
          home: child,
        ),
      ),
    );
  }
}
