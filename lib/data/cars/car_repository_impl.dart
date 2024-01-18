import 'package:cached_annotation/cached_annotation.dart';
import 'package:iteo_libraries_example/data/cars/mapper/car_dto_to_car_mapper.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

part 'car_repository_impl.cached.dart';

@WithCache()
abstract mixin class CarRepositoryImpl implements CarRepository, _$CarRepositoryImpl {
  factory CarRepositoryImpl({
    required CarRemoteDataSource carRemoteDataSource,
    required CarDTOToCarMapper carDTOToCarMapper,
  }) = _CarRepositoryImpl;

  @Cached(syncWrite: true)
  @override
  Future<List<Car>> getCars() async {
    final carsDTO = await carRemoteDataSource.getCarList();
    return carDTOToCarMapper(carsDTO);
  }
}
