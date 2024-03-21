import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class CarLocalRepositoryImpl implements CarLocalRepository {
  CarLocalRepositoryImpl(this.database);

  final DriftLocalDatabase database;

  @override
  Future<List<Car>> getCarsFromLocalDatabase(List<Car> cars) {
    // TODO: implement getCarsFromLocalDatabase
    throw UnimplementedError();
  }

  @override
  Future<void> removeAll() {
    // TODO: implement removeAll
    throw UnimplementedError();
  }

  @override
  Future<void> saveCars(List<Car> cars) {
    // TODO: implement saveCars
    throw UnimplementedError();
  }
}
