import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class ClearCarsFromLocalUseCase {
  const ClearCarsFromLocalUseCase(this._carLocalRepository);
  final CarLocalRepository _carLocalRepository;

  Future<void> call() => _carLocalRepository.removeAll();
}
