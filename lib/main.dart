import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/core/di/di_config.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';
import 'package:iteo_libraries_example/presentation/widget/providers/app_colors_provider.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_shadows.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_typo.dart';
import 'package:provider/provider.dart';

const appLocale = Locale('pl');

FutureOr<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await configureDependencies();
    final appRouter = AppRouter();
    await EasyLocalization.ensureInitialized();

    runApp(
      HookedBlocConfigProvider(
        injector: () => getIt.get,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AppColorsProvider(
                getIt<GetAppThemeTypeStreamUseCase>(),
              ),
            ),
            ProxyProvider<AppColorsProvider, AppTypo>(
              update: (_, value, __) => AppTypo(value.colors),
            ),
            ProxyProvider<AppColorsProvider, AppShadows>(
              update: (_, value, __) => AppShadows(value.colors),
            ),
          ],
          child: EasyLocalization(
            path: 'assets/translations',
            supportedLocales: const [appLocale],
            startLocale: appLocale,
            fallbackLocale: appLocale,
            child: MyApp(appRouter),
          ),
        ),
      ),
    );
  },
  (error, stackTrace) {

  },);
}

class MyApp extends StatelessWidget {
  const MyApp(this.appRouter, {Key? key}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: _theme(context.colors),
      routerConfig: appRouter.config(),
    );
  }

  /// Theme.of(context).extension<AppTheme>()!
  ThemeData _theme(AppColors colors) {
    final appTheme = colors is LightThemeAppColors
        ? AppTheme.light
        : AppTheme.dark;
    return ThemeData(
      extensions: [appTheme],
      scaffoldBackgroundColor: colors.background,
      brightness: colors.brightness,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary,
        selectionHandleColor: colors.primary,
        selectionColor: colors.primary.withOpacity(0.2),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(primaryColor: colors.primary),
      colorScheme: ColorScheme.light(
        secondary: colors.primary,
        brightness: colors.brightness,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colors.typo, // Set the color for selected icon
        unselectedItemColor: colors.typo, // Set the color for unselected icons
      ),
    );
  }
}
