import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technique_step_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TechniqueStepDTO {
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

  final String id;
  @JsonKey(name: 'technique_id')
  final String techniqueId;
  @JsonKey(name: 'step_number')
  final int stepNumber;
  final MultiLangStringDTO title;
  final MultiLangStringDTO instruction;
  final String duration;
  final List<MultiLangStringDTO> examples;
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
}
