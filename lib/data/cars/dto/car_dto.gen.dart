import 'package:json_annotation/json_annotation.dart';

part 'car_dto.gen.g.dart';

@JsonSerializable()
class CarDTO {
  CarDTO({
    required this.id,
    required this.brand,
    required this.model,
    required this.registration,
    this.color,
  });

  factory CarDTO.fromDynamic(dynamic data) => _$CarDTOFromJson(data as Map<String, dynamic>);

  @JsonKey(name: '_id')
  final String id;
  final String brand;
  final String model;
  final String registration;
  final String? color;

  Map<String, dynamic> toJson() => _$CarDTOToJson(this);
}
