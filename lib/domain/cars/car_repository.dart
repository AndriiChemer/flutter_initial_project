import 'package:iteo_libraries_example/domain/cars/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
}
