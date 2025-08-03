import 'package:iteo_libraries_example/app_write/dto/appwrite_converter.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'сourse_dto.g.dart';

@JsonSerializable()
class CourseDTO implements AppwriteConverter {
  const CourseDTO({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory CourseDTO.fromJson(Map<String, dynamic> json) => _$CourseDTOFromJson(json);

  factory CourseDTO.fromAppWriteJson(Map<String, dynamic> json) => CourseDTO(
        id: json['id'] as String,
        slug: json['slug'] as String,
        name: MultiLangStringDTO.fromStringJson(json['name_json'] as String),
        description: MultiLangStringDTO.fromStringJson(json['description_json'] as String),
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        duration: json['duration'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        status: statusFromString(json['status'] as String),
      );

  final String id;
  final String slug;
  final MultiLangStringDTO name;
  final MultiLangStringDTO description;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final int duration;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final StatusDTO status;

  Map<String, dynamic> toJson() => _$CourseDTOToJson(this);

  @override
  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'slug': slug,
        'name_json': name.toString(),
        'description_json': description.toString(),
        'category_id': categoryId,
        'duration': duration,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'status': statusToString(status),
      };

  CourseDTO copyWith({
    String? id,
    String? slug,
    MultiLangStringDTO? name,
    MultiLangStringDTO? description,
    String? categoryId,
    int? duration,
    DateTime? createdAt,
    DateTime? updatedAt,
    StatusDTO? status,
  }) {
    return CourseDTO(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
