import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/appwrite_converter.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';

import '../multi_land_string_dto.dart';

class SubcategoryDTO implements AppwriteConverter {
  SubcategoryDTO({
    required this.id,
    required this.slug,
    required this.name,
    required this.status,
  });

  factory SubcategoryDTO.fromJson(Map<String, dynamic> json) => SubcategoryDTO(
        name: MultiLangStringDTO.fromJson(json['name'] as Map<String, dynamic>),
        slug: json['slug'] as String,
        id: json['slug'] as String,
        status: StatusDTO.active,
      );

  factory SubcategoryDTO.fromAppWriteJson(Map<String, dynamic> json) => SubcategoryDTO(
        name: MultiLangStringDTO.fromStringJson(json['name_json'] as String),
        slug: json['slug'] as String,
        id: json['id'] as String,
        status: statusFromString(json['status'] as String),
      );

  final String id;
  final MultiLangStringDTO name;
  final String slug;
  final StatusDTO status;

  Map<String, dynamic> toJson() => {
        'name': name.toJson(),
        'slug': slug,
        'id': id,
        'status': statusToString(status),
      };

  @override
  Map<String, dynamic> toDataBaseJson() => {
        'name_json': name.toString(),
        'slug': slug,
        'id': id,
        'status': statusToString(status),
      };

  @override
  String toString() => jsonEncode(toJson());
}
