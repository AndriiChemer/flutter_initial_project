// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.gen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
