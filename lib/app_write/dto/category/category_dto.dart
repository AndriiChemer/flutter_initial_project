import 'dart:convert';

import '../multi_land_string_dto.dart';

class CategoryDTO {
  CategoryDTO({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
        id: json['id'] as String,
        name: MultiLangStringDTO.fromJson(json['name'] as Map<String, dynamic>),
        slug: json['slug'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );
  final String id;
  final MultiLangStringDTO name;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name.toJson(),
        'slug': slug,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'name': name.toString(),
        'slug': slug,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() => jsonEncode(toJson());
}
