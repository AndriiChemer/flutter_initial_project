import 'dart:convert';

import '../multi_land_string_dto.dart';

class ChallengeStepDTO {
  ChallengeStepDTO({
    required this.id,
    required this.challengeId,
    required this.stepNumber,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChallengeStepDTO.fromJson(Map<String, dynamic> json) => ChallengeStepDTO(
        id: json['id'] as String,
        challengeId: json['challenge_id'] as String,
        stepNumber: json['step_number'] as int,
        content: MultiLangStringDTO.fromJson(json['content'] as Map<String, dynamic>),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );
  final String id;
  final String challengeId;
  final int stepNumber;
  final MultiLangStringDTO content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'challenge_id': challengeId,
        'step_number': stepNumber,
        'content': content.toJson(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'challenge_id': challengeId,
        'step_number': stepNumber,
        'content': content.toString(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() => jsonEncode(toJson());
}
