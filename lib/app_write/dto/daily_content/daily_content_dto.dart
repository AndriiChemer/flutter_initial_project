import 'package:iteo_libraries_example/app_write/dto/daily_content/json/daily_content_json_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_content_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyContentDTO {
  const DailyContentDTO({
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
    required this.dailyTaskId,
    required this.challengeId,
    required this.phraseId,
    required this.techniqueId,
    required this.testId,
  });

  factory DailyContentDTO.fromDailyContentJsonDTO({
    required DailyContentJsonDTO dailyContentJsonDTO,
    required String? dailyTaskId,
    required String phraseId,
    required String? challengeId,
    required String? techniqueId,
    required String? testId,
  }) =>
      DailyContentDTO(
        id: dailyContentJsonDTO.id,
        dayNumber: dailyContentJsonDTO.dayNumber,
        courseId: dailyContentJsonDTO.courseId,
        courseSlug: dailyContentJsonDTO.courseSlug,
        categoryId: dailyContentJsonDTO.categoryId,
        isDailyTaskRequired: dailyContentJsonDTO.isDailyTaskRequired,
        isTechniqueRequired: dailyContentJsonDTO.isTechniqueRequired,
        isChallengeRequired: dailyContentJsonDTO.isChallengeRequired,
        isTestRequired: dailyContentJsonDTO.isTestRequired,
        status: dailyContentJsonDTO.status,
        createdAt: dailyContentJsonDTO.createdAt,
        dailyTaskId: dailyTaskId,
        challengeId: challengeId,
        techniqueId: techniqueId,
        testId: testId,
        phraseId: phraseId,
      );

  factory DailyContentDTO.fromJson(Map<String, dynamic> json) => _$DailyContentDTOFromJson(json);

  factory DailyContentDTO.fromAppWriteJson(Map<String, dynamic> json) => DailyContentDTO(
        id: json['id'] as String,
        dayNumber: json['day_number'] as int,
        courseId: (json['course_id'] as Map<String, dynamic>)['id'] as String,
        courseSlug: json['course_slug'] as String,
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        isDailyTaskRequired: json['is_daily_task_required'] as bool,
        isTechniqueRequired: json['is_technique_required'] as bool,
        isChallengeRequired: json['is_challenge_required'] as bool,
        isTestRequired: json['is_test_required'] as bool,
        status: statusFromString(json['status'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        dailyTaskId: (json['daily_task_id'] as Map<String, dynamic>)['id'] as String,
        challengeId: (json['challenge_id'] as Map<String, dynamic>)['id'] as String,
        phraseId: (json['phrase_id'] as Map<String, dynamic>)['id'] as String,
        techniqueId: (json['technique_id'] as Map<String, dynamic>)['id'] as String,
        testId: (json['test_id'] as Map<String, dynamic>)['id'] as String,
      );

  final String id;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  @JsonKey(name: 'course_id')
  final String courseId;
  @JsonKey(name: 'course_slug')
  final String courseSlug;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'phrase_id')
  final String phraseId;
  @JsonKey(name: 'daily_task_id')
  final String? dailyTaskId;
  @JsonKey(name: 'technique_id')
  final String? techniqueId;
  @JsonKey(name: 'challenge_id')
  final String? challengeId;
  @JsonKey(name: 'test_id')
  final String? testId;
  @JsonKey(name: 'is_daily_task_required')
  final bool isDailyTaskRequired;
  @JsonKey(name: 'is_technique_required')
  final bool isTechniqueRequired;
  @JsonKey(name: 'is_challenge_required')
  final bool isChallengeRequired;
  @JsonKey(name: 'is_test_required')
  final bool isTestRequired;
  final StatusDTO status;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$DailyContentDTOToJson(this);

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'day_number': dayNumber,
        'course_id': courseId,
        'course_slug': courseSlug,
        'category_id': categoryId,
        'phrase_id': phraseId,
        'daily_task_id': dailyTaskId,
        'technique_id': techniqueId,
        'challenge_id': challengeId,
        'test_id': testId,
        'is_daily_task_required': isDailyTaskRequired,
        'is_technique_required': isTechniqueRequired,
        'is_challenge_required': isChallengeRequired,
        'is_test_required': isTestRequired,
        'status': statusToString(status),
        'created_at': createdAt.toIso8601String(),
      };

  DailyContentDTO copyWith({
    String? id,
    int? dayNumber,
    String? courseId,
    String? courseSlug,
    String? categoryId,
    String? phraseId,
    String? dailyTaskId,
    String? techniqueId,
    String? challengeId,
    String? testId,
    bool? isDailyTaskRequired,
    bool? isTechniqueRequired,
    bool? isChallengeRequired,
    bool? isTestRequired,
    StatusDTO? status,
    DateTime? createdAt,
  }) {
    return DailyContentDTO(
      id: id ?? this.id,
      dayNumber: dayNumber ?? this.dayNumber,
      courseId: courseId ?? this.courseId,
      courseSlug: courseSlug ?? this.courseSlug,
      categoryId: categoryId ?? this.categoryId,
      phraseId: phraseId ?? this.phraseId,
      isDailyTaskRequired: isDailyTaskRequired ?? this.isDailyTaskRequired,
      isTechniqueRequired: isTechniqueRequired ?? this.isTechniqueRequired,
      isChallengeRequired: isChallengeRequired ?? this.isChallengeRequired,
      isTestRequired: isTestRequired ?? this.isTestRequired,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      dailyTaskId: dailyTaskId ?? this.dailyTaskId,
      challengeId: challengeId ?? this.challengeId,
      techniqueId: techniqueId ?? this.techniqueId,
      testId: testId ?? this.testId,
    );
  }
}
