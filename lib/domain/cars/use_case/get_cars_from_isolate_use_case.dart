import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class GetCarsFromIsolateUseCase {
  const GetCarsFromIsolateUseCase(this._carRepository);
  final CarRepository _carRepository;

  Future<List<Car>> call() => _carRepository.getCarsFromIsolate();
}
