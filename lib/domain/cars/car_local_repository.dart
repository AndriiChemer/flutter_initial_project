import 'package:iteo_libraries_example/domain/cars/model/car.dart';

abstract class CarLocalRepository {
  Future<void> saveCars(List<Car> cars);

  Future<List<Car>> getCarsFromLocalDatabase();

  Future<void> removeAll();
}
