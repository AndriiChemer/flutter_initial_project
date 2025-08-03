import 'package:iteo_libraries_example/app_write/dto/appwrite_converter.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technique_step_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TechniqueStepDTO implements AppwriteConverter {
  TechniqueStepDTO({
    required this.id,
    required this.techniqueId,
    required this.stepNumber,
    required this.title,
    required this.instruction,
    required this.duration,
    required this.examples,
    required this.tips,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TechniqueStepDTO.fromJson(Map<String, dynamic> json) => _$TechniqueStepDTOFromJson(json);

  factory TechniqueStepDTO.fromDynamic(dynamic data) => _$TechniqueStepDTOFromJson(data as Map<String, dynamic>);

  factory TechniqueStepDTO.fromAppWriteJson(Map<String, dynamic> json) => TechniqueStepDTO(
        id: json['id'] as String,
        techniqueId: (json['technique_id'] as Map<String, dynamic>)['id'] as String,
        stepNumber: json['step_number'] as int,
        title: MultiLangStringDTO.fromStringJson(json['title_json'] as String),
        instruction: MultiLangStringDTO.fromStringJson(json['instruction_json'] as String),
        duration: json['duration'] as String,
        examples: (json['examples_json_array'] as List<dynamic>?)
            ?.map((e) => MultiLangStringDTO.fromStringJson(e as String))
            .toList(),
        tips: (json['tips_json_array'] as List<dynamic>)
            .map((e) => MultiLangStringDTO.fromStringJson(e as String))
            .toList(),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  final String id;
  @JsonKey(name: 'technique_id')
  final String techniqueId;
  @JsonKey(name: 'step_number')
  final int stepNumber;
  final MultiLangStringDTO title;
  final MultiLangStringDTO instruction;
  final String duration;
  final List<MultiLangStringDTO>? examples;
  final List<MultiLangStringDTO> tips;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  TechniqueStepDTO copyWith({
    String? id,
    String? techniqueId,
    int? stepNumber,
    MultiLangStringDTO? title,
    MultiLangStringDTO? instruction,
    String? duration,
    List<MultiLangStringDTO>? examples,
    List<MultiLangStringDTO>? tips,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TechniqueStepDTO(
      id: id ?? this.id,
      techniqueId: techniqueId ?? this.techniqueId,
      stepNumber: stepNumber ?? this.stepNumber,
      title: title ?? this.title,
      instruction: instruction ?? this.instruction,
      duration: duration ?? this.duration,
      examples: examples ?? this.examples,
      tips: tips ?? this.tips,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$TechniqueStepDTOToJson(this);

  @override
  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'technique_id': techniqueId,
        'step_number': stepNumber,
        'title_json': title.toString(),
        'instruction_json': instruction.toString(),
        'duration': duration,
        'examples_json_array': examples?.map((e) => e.toString()).toList(),
        'tips_json_array': tips.map((e) => e.toString()).toList(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
