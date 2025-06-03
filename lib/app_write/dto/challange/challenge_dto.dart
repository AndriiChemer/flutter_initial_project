import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/free_or_premiun_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';

class ChallengeDTO {
  ChallengeDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.days,
    required this.goal,
    required this.categoryId,
    required this.categorySlug,
    required this.subcategorySlug,
    required this.tags,
    required this.imageName,
    required this.recommendedFor,
    required this.freeOrPremium,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChallengeDTO.fromJson(Map<String, dynamic> json) {
    final oldId = json['id'] as String;
    final words = oldId.split('_');
    final prefix = words.first;
    words
      ..removeAt(0)
      ..add(prefix);
    final newId = words.join('_');

    return ChallengeDTO(
      id: newId,
      title: MultiLangStringDTO.fromJson(json['title'] as Map<String, dynamic>),
      description: MultiLangStringDTO.fromJson(json['description'] as Map<String, dynamic>),
      days: json['days'] as int,
      goal: MultiLangStringDTO.fromJson(json['goal'] as Map<String, dynamic>),
      categoryId: json['category_id'] as String,
      categorySlug: json['category_id'] as String,
      subcategorySlug: json['subcategory_slug'] as String?,
      tags: (json['tags'] as List<dynamic>).map((item) => item as String).toList(),
      imageName: json['image'] as String,
      recommendedFor: MultiLangStringDTO.fromJson(json['recommended_for'] as Map<String, dynamic>),
      freeOrPremium: freeOrPremiumFromString(json['free_or_premium'] as String),
      status: StatusDTO.active,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  factory ChallengeDTO.fromAppWriteJson(Map<String, dynamic> json) => ChallengeDTO(
        id: json['id'] as String,
        title: MultiLangStringDTO.fromStringJson(json['title_json'] as String),
        description: MultiLangStringDTO.fromStringJson(json['description_json'] as String),
        days: json['days'] as int,
        goal: MultiLangStringDTO.fromStringJson(json['goal_json'] as String),
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        categorySlug: json['category_slug'] as String,
        subcategorySlug: json['subcategory_slug'] as String?,
        tags: (json['tags'] as List<dynamic>).map((item) => item as String).toList(),
        imageName: json['image_name'] as String,
        recommendedFor: MultiLangStringDTO.fromStringJson(json['recommended_for_json'] as String),
        freeOrPremium: freeOrPremiumFromString(json['free_or_premium'] as String),
        status: statusFromString(json['status'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  final String id;
  final MultiLangStringDTO title;
  final MultiLangStringDTO description;
  final int days;
  final MultiLangStringDTO goal;
  final String categoryId;
  final String categorySlug;
  final String? subcategorySlug;
  final List<String> tags;
  final String imageName;
  final MultiLangStringDTO recommendedFor;
  final FreeOrPremiumDTO freeOrPremium;
  final StatusDTO status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title.toJson(),
        'description': description.toJson(),
        'days': days,
        'goal': goal.toJson(),
        'category_id': categoryId,
        'category_slug': categorySlug,
        'subcategory_slug': subcategorySlug,
        'tags': tags,
        'image_name': imageName,
        'recommended_for': recommendedFor.toJson(),
        'free_or_premium': freeOrPremiumToString(freeOrPremium),
        'status': statusToString(status),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'title_json': title.toString(),
        'description_json': description.toString(),
        'days': days,
        'goal_json': goal.toString(),
        'category_id': categoryId,
        'category_slug': categorySlug,
        'subcategory_slug': subcategorySlug,
        'tags': tags,
        'image_name': imageName,
        'recommended_for_json': recommendedFor.toString(),
        'free_or_premium': freeOrPremiumToString(freeOrPremium),
        'status': statusToString(status),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() => jsonEncode(toJson());
}
