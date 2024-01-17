import 'package:iteo_libraries_example/data/cars/dto/car_dto.gen.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';

class CarDTOToCarMapper {
  List<Car> call(List<CarDTO> list) => list.map((dto) => Car(
    id: dto.id,
    brand: dto.brand,
    model: dto.model,
    registration: dto.registration,
  ),).toList();
}
