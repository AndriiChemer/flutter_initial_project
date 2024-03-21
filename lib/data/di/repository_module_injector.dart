import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/data/cars/car_local_repository_impl.dart';
import 'package:iteo_libraries_example/data/cars/car_repository_impl.dart';
import 'package:iteo_libraries_example/data/cars/mapper/car_dto_to_car_mapper.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/data/deep_link/deep_link_repository_impl.dart';
import 'package:iteo_libraries_example/data/security/security_repository_impl.dart';
import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/deep_link/deep_link_repository.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';

Future<void> injectRepositoryModule(GetIt getIt) async {
  /// Mappers
  getIt.registerFactory<CarDTOToCarMapper>(() => CarDTOToCarMapper());

  /// Repositories
  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(
    carRemoteDataSource: getIt<CarRemoteDataSource>(),
    carDTOToCarMapper: getIt<CarDTOToCarMapper>(),
  ),);

  getIt.registerLazySingleton<DeepLinkRepository>(() => DeepLinkRepositoryImpl());

  getIt.registerLazySingleton<SecurityRepository>(() => SecurityRepositoryImpl(getIt<FlutterSecureStorage>()));

  getIt.registerLazySingleton<CarLocalRepository>(() => CarLocalRepositoryImpl(getIt<DriftLocalDatabase>()));
}
