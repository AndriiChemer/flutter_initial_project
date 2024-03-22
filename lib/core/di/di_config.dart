import 'dart:async';
import 'package:fimber/fimber.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/core/app_env.dart';
import 'package:iteo_libraries_example/core/di/cubit_module.dart';
import 'package:iteo_libraries_example/core/logger/crashlytics_reporting_tree.dart';
import 'package:iteo_libraries_example/core/logger/logger.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/data/di/data_injector.dart';
import 'package:iteo_libraries_example/data/di/data_source_module_injector.dart';
import 'package:iteo_libraries_example/data/di/database_module_injector.dart';
import 'package:iteo_libraries_example/data/di/repository_module_injector.dart';
import 'package:iteo_libraries_example/data/di/storage_module_injector.dart';
import 'package:iteo_libraries_example/domain/di/use_cases_injector.dart';
import 'package:iteo_libraries_example/domain/di/validator_module.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies(AppEnv appEnv) => _initGetIt(appEnv);

Future<void> _initGetIt(AppEnv appEnv) async {
  getIt.registerSingleton(appEnv);

  /// Data layer
  await injectStorageModule(getIt);
  await injectDataModule(getIt);
  await injectDataSourceModule(getIt);
  await injectRepositoryModule(getIt);
  await injectDatabaseModule(getIt);


  /// Domain layer
  await injectUseCasesModule(getIt);
  await injectValidatorModule(getIt);

  /// Presentation layer
  await injectCubitModule(getIt);

  /// LOGGER
  getIt.registerSingleton(<LogTree>[
    CrashlyticsReportingTree(),
    Logger.debugTree,
  ]);
}
