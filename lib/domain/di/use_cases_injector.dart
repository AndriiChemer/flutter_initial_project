import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';

Future<void> injectUseCasesModule(GetIt getIt) async {
  getIt.registerFactory<GetAppThemeTypeStreamUseCase>(
    () => GetAppThemeTypeStreamUseCase(getIt<AppThemeTypeStorage>()),
  );

  getIt.registerFactory<SaveAppThemeTypeUseCase>(
    () => SaveAppThemeTypeUseCase(getIt<AppThemeTypeStorage>()),
  );
}