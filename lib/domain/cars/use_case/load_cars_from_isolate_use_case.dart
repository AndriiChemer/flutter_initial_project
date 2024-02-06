import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class LoadCarsFromIsolateUseCase {
  const LoadCarsFromIsolateUseCase(this._carRepository);
  final CarRepository _carRepository;

  void call({
    required void Function(List<Car> cars) onSuccess,
    required void Function(String error, String stacktrace) onError,
  }) => _carRepository.loadCarsFromIsolate(
    onSuccess: onSuccess,
    onError: onError,
  );
}
