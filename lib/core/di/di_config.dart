import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/core/di/cubit_module.dart';
import 'package:iteo_libraries_example/data/di/data_injector.dart';
import 'package:iteo_libraries_example/data/di/data_source_module_injector.dart';
import 'package:iteo_libraries_example/data/di/database_module_injector.dart';
import 'package:iteo_libraries_example/data/di/repository_module_injector.dart';
import 'package:iteo_libraries_example/domain/di/use_cases_injector.dart';
import 'package:iteo_libraries_example/domain/di/validator_module.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() => _initGetIt();

Future<void> _initGetIt() async {
  /// Data layer
  await injectDatabaseModule(getIt);
  await injectDataModule(getIt);
  await injectDataSourceModule(getIt);
  await injectRepositoryModule(getIt);

  /// Domain layer
  await injectUseCasesModule(getIt);
  await injectValidatorModule(getIt);

  /// Presentation layer
  await injectCubitModule(getIt);
}