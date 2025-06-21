import 'package:json_annotation/json_annotation.dart';

part 'daily_content_json_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyContentJsonDTO {
  const DailyContentJsonDTO({
    required this.id,
    required this.dayNumber,
    required this.courseId,
    required this.courseSlug,
    required this.categoryId,
    required this.isDailyTaskRequired,
    required this.isTechniqueRequired,
    required this.isChallengeRequired,
    required this.isTestRequired,
    required this.status,
    required this.createdAt,
    this.phraseTitle,
    this.dailyTaskTitle,
    this.techniqueTitle,
    this.challengeTitle,
    this.testTitle,
  });

  factory DailyContentJsonDTO.fromJson(Map<String, dynamic> json) => _$DailyContentJsonDTOFromJson(json);

  final String id;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  @JsonKey(name: 'course_id')
  final String courseId;
  @JsonKey(name: 'course_slug')
  final String courseSlug;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'phrase_title')
  final String? phraseTitle;
  @JsonKey(name: 'daily_task_title')
  final String? dailyTaskTitle;
  @JsonKey(name: 'technique_title')
  final String? techniqueTitle;
  @JsonKey(name: 'challenge_title')
  final String? challengeTitle;
  @JsonKey(name: 'test_title')
  final String? testTitle;
  @JsonKey(name: 'is_daily_task_required')
  final bool isDailyTaskRequired;
  @JsonKey(name: 'is_technique_required')
  final bool isTechniqueRequired;
  @JsonKey(name: 'is_challenge_required')
  final bool isChallengeRequired;
  @JsonKey(name: 'is_test_required')
  final bool isTestRequired;
  final String status;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$DailyContentJsonDTOToJson(this);

  DailyContentJsonDTO copyWith({
    String? id,
    int? dayNumber,
    String? courseId,
    String? courseSlug,
    String? categoryId,
    String? phraseTitle,
    String? dailyTaskTitle,
    String? techniqueTitle,
    String? challengeTitle,
    String? testTitle,
    bool? isDailyTaskRequired,
    bool? isTechniqueRequired,
    bool? isChallengeRequired,
    bool? isTestRequired,
    String? status,
    DateTime? createdAt,
  }) {
    return DailyContentJsonDTO(
      id: id ?? this.id,
      dayNumber: dayNumber ?? this.dayNumber,
      courseId: courseId ?? this.courseId,
      courseSlug: courseSlug ?? this.courseSlug,
      categoryId: categoryId ?? this.categoryId,
      phraseTitle: phraseTitle ?? this.phraseTitle,
      dailyTaskTitle: dailyTaskTitle ?? this.dailyTaskTitle,
      techniqueTitle: techniqueTitle ?? this.techniqueTitle,
      challengeTitle: challengeTitle ?? this.challengeTitle,
      testTitle: testTitle ?? this.testTitle,
      isDailyTaskRequired: isDailyTaskRequired ?? this.isDailyTaskRequired,
      isTechniqueRequired: isTechniqueRequired ?? this.isTechniqueRequired,
      isChallengeRequired: isChallengeRequired ?? this.isChallengeRequired,
      isTestRequired: isTestRequired ?? this.isTestRequired,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
