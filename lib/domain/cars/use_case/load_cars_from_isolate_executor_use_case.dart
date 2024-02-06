import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class LoadCarsFromIsolateExecutorUseCase {
  const LoadCarsFromIsolateExecutorUseCase(this._carRepository);
  final CarRepository _carRepository;

  void call({
    required void Function(List<Car> cars) onSuccess,
    required void Function(String error, String stacktrace) onError,
  }) => _carRepository.loadCarsFromIsolateExecutor(
    onSuccess: onSuccess,
    onError: onError,
  );
}
