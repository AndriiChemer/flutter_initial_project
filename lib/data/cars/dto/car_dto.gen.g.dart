// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dto.gen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDTO _$CarDTOFromJson(Map<String, dynamic> json) => CarDTO(
      id: json['_id'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      registration: json['registration'] as String,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$CarDTOToJson(CarDTO instance) => <String, dynamic>{
      '_id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'registration': instance.registration,
      'color': instance.color,
    };
