import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class GetCarsFromLocalUseCase {
  const GetCarsFromLocalUseCase(this._carLocalRepository);
  final CarLocalRepository _carLocalRepository;

  Future<List<Car>> call() => _carLocalRepository.getCarsFromLocalDatabase();
}
