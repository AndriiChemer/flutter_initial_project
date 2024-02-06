import 'package:iteo_libraries_example/domain/cars/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();

  Future<List<Car>> getCarsFromIsolate();

  Future<List<Car>> getCarsFromIsolateExecutor();

  void loadCarsFromIsolate({
    required void Function(List<Car> cars) onSuccess,
    required void Function(String error, String stacktrace) onError,
  });

  void loadCarsFromIsolateExecutor({
    required void Function(List<Car> cars) onSuccess,
    required void Function(String error, String stacktrace) onError,
  });
}
