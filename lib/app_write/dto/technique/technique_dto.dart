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

  factory TechniqueDTO.fromAppWriteJson(Map<String, dynamic> json) => TechniqueDTO(
        id: json['id'] as String,
        title: MultiLangStringDTO.fromStringJson(json['title_json'] as String),
        description: MultiLangStringDTO.fromStringJson(json['description_json'] as String),
        goal: MultiLangStringDTO.fromStringJson(json['goal_json'] as String),
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        subcategorySlug: json['subcategory_slug'] as String?,
        widgetType: json['widget_type'] as String?,
        duration: json['duration'] as String,
        status: $enumDecode(_$StatusDTOEnumMap, json['status']),
        examples: (json['examples_json_array'] as List<dynamic>)
            .map((e) => MultiLangStringDTO.fromStringJson(e as String))
            .toList(),
        tips: (json['tips_json_array'] as List<dynamic>?)
            ?.map((e) => MultiLangStringDTO.fromStringJson(e as String))
            .toList(),
        freeOrPremium: $enumDecode(_$FreeOrPremiumDTOEnumMap, json['free_or_premium']),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  final String id;
  final MultiLangStringDTO title;
  final MultiLangStringDTO description;
  final MultiLangStringDTO goal;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'subcategory_slug')
  final String? subcategorySlug;
  @JsonKey(name: 'widget_type')
  final String? widgetType;
  final String duration;
  final StatusDTO status;
  final List<MultiLangStringDTO> examples;
  final List<MultiLangStringDTO>? tips;
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

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'title_json': title.toString(),
        'description_json': description.toString(),
        'goal_json': goal.toString(),
        'category_id': categoryId,
        'subcategory_slug': subcategorySlug,
        'widget_type': widgetType,
        'duration': duration,
        'status': _$StatusDTOEnumMap[status],
        'examples_json_array': examples.map((e) => e.toString()).toList(),
        'tips_json_array': tips?.map((e) => e.toString()).toList(),
        'free_or_premium': _$FreeOrPremiumDTOEnumMap[freeOrPremium],
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
