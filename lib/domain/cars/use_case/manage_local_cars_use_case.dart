import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class ManageLocalCarsUseCase {
  const ManageLocalCarsUseCase(this._carLocalRepository);
  final CarLocalRepository _carLocalRepository;

  Future<void> clearCars() async {
    await _carLocalRepository.removeAll();
  }

  Future<List<Car>> getCars() async {
    return _carLocalRepository.getCarsFromLocalDatabase();
  }

  Future<void> save(List<Car> cars) => _carLocalRepository.saveCars(cars);
}
