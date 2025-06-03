import 'package:iteo_libraries_example/app_write/dto/free_or_premiun_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technique_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TechniqueDTO {
  TechniqueDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.goal,
    required this.categoryId,
    required this.subcategorySlug,
    required this.widgetType,
    required this.duration,
    required this.status,
    required this.examples,
    required this.tips,
    required this.freeOrPremium,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TechniqueDTO.fromJson(Map<String, dynamic> json) => _$TechniqueDTOFromJson(json);

  final String id;
  final MultiLangStringDTO title;
  final MultiLangStringDTO description;
  final MultiLangStringDTO goal;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'subcategory_slug')
  final String subcategorySlug;
  @JsonKey(name: 'widget_type')
  final String widgetType;
  final String duration;
  final StatusDTO status;
  final List<MultiLangStringDTO> examples;
  final List<MultiLangStringDTO> tips;
  @JsonKey(name: 'free_or_premium')
  final FreeOrPremiumDTO freeOrPremium;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  TechniqueDTO copyWith({
    String? id,
    MultiLangStringDTO? title,
    MultiLangStringDTO? description,
    MultiLangStringDTO? goal,
    String? categoryId,
    String? subcategorySlug,
    String? widgetType,
    String? duration,
    StatusDTO? status,
    List<MultiLangStringDTO>? examples,
    List<MultiLangStringDTO>? tips,
    FreeOrPremiumDTO? freeOrPremium,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TechniqueDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      goal: goal ?? this.goal,
      categoryId: categoryId ?? this.categoryId,
      subcategorySlug: subcategorySlug ?? this.subcategorySlug,
      widgetType: widgetType ?? this.widgetType,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      examples: examples ?? this.examples,
      tips: tips ?? this.tips,
      freeOrPremium: freeOrPremium ?? this.freeOrPremium,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$TechniqueDTOToJson(this);
}
