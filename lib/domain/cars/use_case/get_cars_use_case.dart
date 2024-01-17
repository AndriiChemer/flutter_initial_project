import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class GetCarsUseCase {
  const GetCarsUseCase(this._carRepository);
  final CarRepository _carRepository;

  Future<List<Car>> call() => _carRepository.getCars();
}
