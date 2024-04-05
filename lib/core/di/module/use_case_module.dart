import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/clear_cars_from_local_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_local_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/save_cars_to_database_use_case.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/deep_link_stream_use_case.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/trigger_deep_links_use_case.dart';

@module
abstract class UseCaseModule {
  @injectable
  GetAppThemeTypeStreamUseCase get getAppThemeTypeStreamUseCase;

  @injectable
  SaveAppThemeTypeUseCase get saveAppThemeTypeUseCase;

  @injectable
  GetCarsUseCase get getCarsUseCase;

  @injectable
  GetCarsFromIsolateExecutorUseCase get getCarsFromIsolateExecutorUseCase;

  @injectable
  LoadCarsFromIsolateExecutorUseCase get loadCarsFromIsolateExecutorUseCase;

  @injectable
  DeepLinkStreamUseCase get deepLinkStreamUseCase;

  @injectable
  TriggerDeepLinksUseCase get triggerDeepLinksUseCase;

  @injectable
  ClearCarsFromLocalUseCase get clearCarsFromLocalUseCase;

  @injectable
  GetCarsFromLocalUseCase get getCarsFromLocalUseCase;

  @injectable
  SaveCarsToDatabaseUseCase get saveCarsToDatabaseUseCase;
}
