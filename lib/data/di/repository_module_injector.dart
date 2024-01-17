import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/data/cars/car_repository_impl.dart';
import 'package:iteo_libraries_example/data/cars/mapper/car_dto_to_car_mapper.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';

Future<void> injectRepositoryModule(GetIt getIt) async {
  /// Mappers
  getIt.registerFactory<CarDTOToCarMapper>(() => CarDTOToCarMapper());

  /// Repositories
  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(
    carRemoteDataSource: getIt<CarRemoteDataSource>(),
    carDTOToCarMapper: getIt<CarDTOToCarMapper>(),
  ),);
}
