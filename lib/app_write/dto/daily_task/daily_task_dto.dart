import 'package:iteo_libraries_example/app_write/dto/daily_task/task_step_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/free_or_premiun_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_task_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyTaskDTO {
  DailyTaskDTO({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.categorySlug,
    required this.description,
    required this.steps,
    required this.widgetType,
    required this.duration,
    required this.status,
    required this.image,
    required this.freeOrPremium,
    required this.tips,
    required this.examples,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DailyTaskDTO.fromJson1(Map<String, dynamic> json) => _$DailyTaskDTOFromJson(json);

  factory DailyTaskDTO.fromJson(Map<String, dynamic> json) => DailyTaskDTO(
        id: json['id'] as String,
        title: MultiLangStringDTO.fromJson(json['title'] as Map<String, dynamic>),
        categoryId: json['category_slug'] as String,
        categorySlug: json['category_slug'] as String,
        description: MultiLangStringDTO.fromJson(json['description'] as Map<String, dynamic>),
        steps: (json['steps'] as List<dynamic>).map((e) => TaskStepDTO.fromJson(e as Map<String, dynamic>)).toList(),
        widgetType: json['widget_type'] as String,
        duration: json['duration'] as String?,
        status: $enumDecode(_$StatusDTOEnumMap, json['status']),
        image: json['image'] as String?,
        freeOrPremium: $enumDecode(_$FreeOrPremiumDTOEnumMap, json['free_or_premium']),
        tips: json.containsKey('tips')
            ? (json['tips'] as List<dynamic>)
                .map((e) => MultiLangStringDTO.fromJson(e as Map<String, dynamic>))
                .toList()
            : [],
        examples: json.containsKey('examples')
            ? (json['examples'] as List<dynamic>)
                .map((e) => MultiLangStringDTO.fromJson(e as Map<String, dynamic>))
                .toList()
            : [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory DailyTaskDTO.fromDynamic(dynamic data) => DailyTaskDTO.fromJson(data as Map<String, dynamic>);

  factory DailyTaskDTO.fromAppWriteJson(Map<String, dynamic> json) => DailyTaskDTO(
        id: json['id'] as String,
        title: MultiLangStringDTO.fromStringJson(json['title_json'] as String),
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        categorySlug: json['category_slug'] as String,
        description: MultiLangStringDTO.fromStringJson(json['description_json'] as String),
        steps: (json['steps_json_array'] as List<dynamic>)
            .map((item) => TaskStepDTO.fromAppWriteJson(item as String))
            .toList(),
        widgetType: json['widget_type'] as String,
        duration: json['duration'] as String?,
        status: statusFromString(json['status'] as String),
        image: json['image'] as String,
        freeOrPremium: freeOrPremiumFromString(json['free_or_premium'] as String),
        tips: (json['tips_json_array'] as List<dynamic>)
            .map((item) => MultiLangStringDTO.fromStringJson(item as String))
            .toList(),
        examples: (json['examples_json_array'] as List<dynamic>)
            .map((item) => MultiLangStringDTO.fromStringJson(item as String))
            .toList(),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  final String id;
  final MultiLangStringDTO title;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'category_slug')
  final String categorySlug;
  final MultiLangStringDTO description;
  final List<TaskStepDTO> steps;
  @JsonKey(defaultValue: [])
  final List<MultiLangStringDTO> tips;
  @JsonKey(defaultValue: [])
  final List<MultiLangStringDTO> examples;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: 'widget_type')
  final String widgetType;
  final String? duration;
  final StatusDTO status;
  final String? image;
  @JsonKey(name: 'free_or_premium')
  final FreeOrPremiumDTO freeOrPremium;

  DailyTaskDTO copyWith({
    String? id,
    MultiLangStringDTO? title,
    String? categoryId,
    String? categorySlug,
    MultiLangStringDTO? description,
    List<TaskStepDTO>? steps,
    String? widgetType,
    String? duration,
    StatusDTO? status,
    String? image,
    FreeOrPremiumDTO? freeOrPremium,
    List<MultiLangStringDTO>? tips,
    List<MultiLangStringDTO>? examples,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DailyTaskDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
      categorySlug: categorySlug ?? this.categorySlug,
      description: description ?? this.description,
      steps: steps ?? this.steps,
      widgetType: widgetType ?? this.widgetType,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      image: image ?? this.image,
      freeOrPremium: freeOrPremium ?? this.freeOrPremium,
      tips: tips ?? this.tips,
      examples: examples ?? this.examples,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$DailyTaskDTOToJson(this);

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'title_json': title.toString(),
        'description_json': description.toString(),
        'widget_type': widgetType,
        'duration': duration,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'category_id': categoryId,
        'category_slug': categorySlug,
        'free_or_premium': freeOrPremiumToString(freeOrPremium),
        'status': statusToString(status),
        'image': image,
        'steps_json_array': steps.map((item) => item.toStringAppWrite()).toList(),
        'tips_json_array': tips.map((item) => item.toString()).toList(),
        'examples_json_array': examples.map((item) => item.toString()).toList(),
      };
}
