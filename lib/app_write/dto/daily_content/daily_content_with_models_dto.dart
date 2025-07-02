import 'package:iteo_libraries_example/app_write/dto/category/category_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/course/%D1%81ourse_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_phrase/daily_phrase_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_content_with_models_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyContentWithModelsDTO {
  const DailyContentWithModelsDTO({
    required this.id,
    required this.dayNumber,
    required this.course,
    required this.courseSlug,
    required this.category,
    required this.isDailyTaskRequired,
    required this.isTechniqueRequired,
    required this.isChallengeRequired,
    required this.isTestRequired,
    required this.status,
    required this.createdAt,
    required this.dailyTask,
    required this.challenge,
    required this.phrase,
    required this.technique,
    required this.test,
  });

  factory DailyContentWithModelsDTO.fromJson(Map<String, dynamic> json) => _$DailyContentWithModelsDTOFromJson(json);

  final String id;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  @JsonKey(
    name: 'course_id',
    fromJson: CourseDTO.fromAppWriteJson,
  )
  final CourseDTO course;
  @JsonKey(name: 'course_slug')
  final String courseSlug;
  @JsonKey(
    name: 'category_id',
    fromJson: CategoryDTO.fromAppWriteJson,
  )
  final CategoryDTO category;
  @JsonKey(
    name: 'phrase_id',
    fromJson: DailyPhraseDTO.fromAppWriteJson,
  )
  final DailyPhraseDTO phrase;
  @JsonKey(
    name: 'daily_task_id',
    fromJson: dailyTaskFromJson,
  )
  final DailyTaskDTO? dailyTask;
  @JsonKey(
    name: 'technique_id',
    fromJson: techniqueFromJson,
  )
  final TechniqueDTO? technique;
  @JsonKey(
    name: 'challenge_id',
    fromJson: challengeFromJson,
  )
  final ChallengeDTO? challenge;
  @JsonKey(
    name: 'test_id',
    fromJson: testFromJson,
  )
  final TestDTO? test;
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
}

TestDTO? testFromJson(dynamic json) {
  if (json == null) return null;
  return TestDTO.fromAppWriteJson(json as Map<String, dynamic>);
}

ChallengeDTO? challengeFromJson(dynamic json) {
  if (json == null) return null;
  return ChallengeDTO.fromAppWriteJson(json as Map<String, dynamic>);
}

TechniqueDTO? techniqueFromJson(dynamic json) {
  if (json == null) return null;
  return TechniqueDTO.fromAppWriteJson(json as Map<String, dynamic>);
}

DailyTaskDTO? dailyTaskFromJson(dynamic json) {
  if (json == null) return null;
  return DailyTaskDTO.fromAppWriteJson(json as Map<String, dynamic>);
}
