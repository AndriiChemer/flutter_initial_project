import 'package:drift/drift.dart';
import 'package:iteo_libraries_example/data/cars/local/entity/car_entity.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class CarLocalRepositoryImpl implements CarLocalRepository {
  CarLocalRepositoryImpl(this.database);

  final DriftLocalDatabase database;

  @override
  Future<List<Car>> getCarsFromLocalDatabase() async {
    final data = await database.carEntity.select().get();
    return data.toDomain();
  }

  @override
  Future<void> removeAll() => database.carEntity.deleteAll();

  @override
  Future<void> saveCars(List<Car> cars) async {
    final entities = CarEntityExt.fromDomainList(cars);
    await database.carEntity.insertAll(
      entities,
      mode: InsertMode.insertOrReplace,
    );
  }
}
