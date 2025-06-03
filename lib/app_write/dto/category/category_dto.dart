import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';

class CategoryDTO {
  CategoryDTO({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
        name: MultiLangStringDTO.fromJson(json['name'] as Map<String, dynamic>),
        slug: json['slug'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        status: StatusDTO.active,
        id: json['slug'] as String,
      );

  factory CategoryDTO.fromAppWriteJson(Map<String, dynamic> json) => CategoryDTO(
        name: MultiLangStringDTO.fromStringJson(json['name_json'] as String),
        slug: json['slug'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        status: statusFromString(json['status'] as String),
        id: json['id'] as String,
      );

  final String id;
  final MultiLangStringDTO name;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final StatusDTO status;

  Map<String, dynamic> toJson() => {
        'name': name.toJson(),
        'slug': slug,
        'id': id,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'status': statusToString(status),
      };

  Map<String, dynamic> toDataBaseJson() => {
        'name_json': name.toString(),
        'slug': slug,
        'id': id,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'status': statusToString(status),
      };

  @override
  String toString() => jsonEncode(toJson());

  CategoryDTO copyWith({
    String? id,
    MultiLangStringDTO? name,
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    StatusDTO? status,
  }) {
    return CategoryDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
