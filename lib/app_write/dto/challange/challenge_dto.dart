import 'dart:convert';

import '../multi_land_string_dto.dart';

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
    required this.image,
    required this.recommendedFor,
    required this.freeOrPremium,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChallengeDTO.fromJson(Map<String, dynamic> json) => ChallengeDTO(
        id: json['id'] as String,
        title: MultiLangStringDTO.fromJson(json['title'] as Map<String, dynamic>),
        description: MultiLangStringDTO.fromJson(json['description'] as Map<String, dynamic>),
        days: json['days'] as int,
        goal: MultiLangStringDTO.fromJson(json['goal'] as Map<String, dynamic>),
        categoryId: json['category_id'] as String,
        categorySlug: json['category_id'] as String,
        subcategorySlug: json['subcategory_slug'] as String?,
        tags: (json['tags'] as List<dynamic>).map((item) => item as String).toList(),
        image: json['image'] as String,
        recommendedFor: MultiLangStringDTO.fromJson(json['recommended_for'] as Map<String, dynamic>),
        freeOrPremium: json['free_or_premium'] as String,
        status: json['status'] as String,
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
  final String image;
  final MultiLangStringDTO recommendedFor;
  final String freeOrPremium;
  final String status;
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
        'image': image,
        'recommended_for': recommendedFor.toJson(),
        'free_or_premium': freeOrPremium,
        'status': status,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'title': title.toString(),
        'description': description.toString(),
        'days': days,
        'goal': goal.toString(),
        'category_id': categoryId,
        'category_slug': categorySlug,
        'subcategory_slug': subcategorySlug,
        'tags': tags,
        'image': image,
        'recommended_for': recommendedFor.toString(),
        'free_or_premium': freeOrPremium,
        'status': status,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() => jsonEncode(toJson());
}
