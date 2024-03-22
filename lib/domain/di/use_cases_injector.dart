import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/clear_cars_from_local_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_local_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/save_cars_to_database_use_case.dart';
import 'package:iteo_libraries_example/domain/deep_link/deep_link_repository.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/deep_link_stream_use_case.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/trigger_deep_links_use_case.dart';

Future<void> injectUseCasesModule(GetIt getIt) async {
  /// App Theming
  getIt.registerFactory<GetAppThemeTypeStreamUseCase>(
    () => GetAppThemeTypeStreamUseCase(getIt<AppThemeTypeStorage>()),
  );

  getIt.registerFactory<SaveAppThemeTypeUseCase>(
    () => SaveAppThemeTypeUseCase(getIt<AppThemeTypeStorage>()),
  );

  /// Car loading
  getIt.registerFactory<GetCarsUseCase>(
    () => GetCarsUseCase(getIt<CarRepository>()),
  );

  getIt.registerFactory<GetCarsFromIsolateUseCase>(
    () => GetCarsFromIsolateUseCase(getIt<CarRepository>()),
  );

  getIt.registerFactory<GetCarsFromIsolateExecutorUseCase>(
    () => GetCarsFromIsolateExecutorUseCase(getIt<CarRepository>()),
  );

  getIt.registerFactory<LoadCarsFromIsolateUseCase>(
    () => LoadCarsFromIsolateUseCase(getIt<CarRepository>()),
  );

  getIt.registerFactory<LoadCarsFromIsolateExecutorUseCase>(
    () => LoadCarsFromIsolateExecutorUseCase(getIt<CarRepository>()),
  );

  /// Deep Links
  getIt.registerFactory<DeepLinkStreamUseCase>(
    () => DeepLinkStreamUseCase(getIt<DeepLinkRepository>()),
  );

  getIt.registerFactory<TriggerDeepLinksUseCase>(
    () => TriggerDeepLinksUseCase(getIt<DeepLinkRepository>()),
  );

  getIt.registerFactory<ClearCarsFromLocalUseCase>(
    () => ClearCarsFromLocalUseCase(getIt<CarLocalRepository>()),
  );

  getIt.registerFactory<GetCarsFromLocalUseCase>(
    () => GetCarsFromLocalUseCase(getIt<CarLocalRepository>()),
  );

  getIt.registerFactory<SaveCarsToDatabaseUseCase>(
    () => SaveCarsToDatabaseUseCase(getIt<CarLocalRepository>()),
  );
}
