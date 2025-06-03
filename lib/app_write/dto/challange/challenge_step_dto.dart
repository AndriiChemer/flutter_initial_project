import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';

class ChallengeStepDTO {
  ChallengeStepDTO({
    required this.id,
    required this.challengeId,
    required this.stepNumber,
    required this.content,
    required this.tips,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChallengeStepDTO.fromJson(Map<String, dynamic> json) {
    final oldChallengeId = json['challenge_id'] as String;
    final words = oldChallengeId.split('_');
    final prefix = words.first;
    words
      ..removeAt(0)
      ..add(prefix);
    final newChallengeId = words.join('_');

    return ChallengeStepDTO(
      id: json['id'] as String,
      challengeId: newChallengeId,
      stepNumber: json['step_number'] as int,
      content: MultiLangStringDTO.fromJson(json['content'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      tips: (json['tips'] as List<dynamic>?)
          ?.map((dynamicItem) => MultiLangStringDTO.fromJson(dynamicItem as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ChallengeStepDTO.fromAppWriteJson(Map<String, dynamic> json) => ChallengeStepDTO(
        id: json['id'] as String,
        challengeId: (json['challenge_id'] as Map<String, dynamic>)['id'] as String,
        stepNumber: json['step_number'] as int,
        content: MultiLangStringDTO.fromStringJson(json['content_json'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        tips: (json['tips'] as List<dynamic>?)
            ?.map((dynamicItem) => MultiLangStringDTO.fromStringJson(dynamicItem as String))
            .toList(),
      );

  final String id;
  final String challengeId;
  final int stepNumber;
  final MultiLangStringDTO content;
  final List<MultiLangStringDTO>? tips;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'challenge_id': challengeId,
        'step_number': stepNumber,
        'content': content.toJson(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'tips': tips?.map((item) => item.toJson()).toList(),
      };

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'challenge_id': challengeId,
        'step_number': stepNumber,
        'content_json': content.toString(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'tips': tips?.map((item) => item.toString()).toList(),
      };

  @override
  String toString() => jsonEncode(toJson());

  ChallengeStepDTO copyWith({
    String? id,
    String? challengeId,
    int? stepNumber,
    MultiLangStringDTO? content,
    List<MultiLangStringDTO>? tips,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ChallengeStepDTO(
      id: id ?? this.id,
      challengeId: challengeId ?? this.challengeId,
      stepNumber: stepNumber ?? this.stepNumber,
      content: content ?? this.content,
      tips: tips ?? this.tips,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
