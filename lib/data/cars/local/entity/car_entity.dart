import 'package:drift/drift.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class CarEntity extends Table with TimestampedTable {
  TextColumn get id => text()();

  TextColumn get brand => text()();

  TextColumn get model => text()();

  TextColumn get registration => text()();

  TextColumn get color => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

extension CarEntityDataListExtension on List<CarEntityData> {
  List<Car> toDomain() {
    return map(
      (entity) => Car(
        id: entity.id,
        brand: entity.brand,
        model: entity.model,
        registration: entity.registration,
      ),
    ).toList();
  }
}

extension CarEntityExt on CarEntityCompanion {
  static Iterable<CarEntityCompanion> fromDomainList(List<Car> cars) {
    return cars.map(
      (car) => CarEntityCompanion.insert(
        id: car.id,
        brand: car.brand,
        model: car.model,
        registration: car.registration,
      ),
    );
  }
}
