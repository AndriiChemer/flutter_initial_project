import 'package:iteo_libraries_example/data/cars/mapper/car_dto_to_car_mapper.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class CarRepositoryImpl implements CarRepository {
  CarRepositoryImpl({
    required this.carRemoteDataSource,
    required this.carDTOToCarMapper,
  });

  final CarRemoteDataSource carRemoteDataSource;
  final CarDTOToCarMapper carDTOToCarMapper;

  @override
  Future<List<Car>> getCars() async {
    final carsDTO = await carRemoteDataSource.getCarList();
    return carDTOToCarMapper(carsDTO);
  }
}
