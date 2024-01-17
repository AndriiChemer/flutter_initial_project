import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:iteo_libraries_example/data/cars/car_repository_impl.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';

Future<void> injectDataSourceModule(GetIt getIt) async {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton<CarRemoteDataSource>(() => CarRemoteDataSourceImpl(getIt<http.Client>()));
}
