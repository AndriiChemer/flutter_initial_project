import 'dart:convert';

import 'package:cached_annotation/cached_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/data/cars/dto/car_dto.gen.dart';
import 'package:iteo_libraries_example/data/cars/mapper/car_dto_to_car_mapper.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';
import 'package:iteo_libraries_example/data/network/chopper_handler.dart';
import 'package:iteo_libraries_example/data/network/isolate_executor.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

part 'car_repository_impl.cached.dart';

// @Singleton(as: CarRepository)
@WithCache()
abstract mixin class CarRepositoryImpl implements CarRepository, _$CarRepositoryImpl {
  @factoryMethod
  factory CarRepositoryImpl({
    required CarRemoteDataSource carRemoteDataSource,
    required CarDTOToCarMapper carDTOToCarMapper,
  }) = _CarRepositoryImpl;

  @Cached(syncWrite: true)
  @override
  Future<List<Car>> getCars() async {
    final carsDTO = await chopperCaller(carRemoteDataSource.getCarList);
    return carDTOToCarMapper(carsDTO);
  }

  @override
  Future<List<Car>> getCarsFromIsolateExecutor() async {
    final stringValue = await executeIsolate<String>(execute: getCarListStatic);

    final dynamicList = jsonDecode(stringValue) as List<dynamic>;
    final carsDTO = dynamicList.map(CarDTO.fromDynamic).toList();
    return carDTOToCarMapper(carsDTO);
  }

  @override
  void loadCarsFromIsolateExecutor({
    required void Function(List<Car> cars) onSuccess,
    required void Function(String error, String stacktrace) onError,
  }) {
    executeIsolate<String>(
      execute: () async {
        final carsDTO = await carRemoteDataSource.getCarList();
        return jsonEncode(carsDTO);
      },
      onSuccess: (value) {
        final dynamicList = jsonDecode(value) as List<dynamic>;
        final carsDTO = dynamicList.map(CarDTO.fromDynamic).toList();
        onSuccess(carDTOToCarMapper(carsDTO));
      },
      onError: onError,
    );
  }
}
