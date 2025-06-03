import 'package:iteo_libraries_example/app_write/dto/free_or_premiun_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_evaluation_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_question_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_recommendations_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TestDTO {
  TestDTO({
    required this.id,
    required this.title,
    required this.level,
    required this.description,
    required this.type,
    required this.categoryId,
    required this.categorySlug,
    required this.status,
    required this.freeOrPremium,
    required this.duration,
    required this.aiAnalysisEnabled,
    required this.pairModeEnabled,
    required this.questions,
    required this.evaluation,
    required this.recommendations,
    required this.widgetType,
  });

  factory TestDTO.fromJson(Map<String, dynamic> json) => _$TestDTOFromJson(json);

  final String id;
  final MultiLangStringDTO title;
  final MultiLangStringDTO level;
  final MultiLangStringDTO description;
  final String type;
  final String categoryId;
  final String categorySlug;
  final StatusDTO status;
  final FreeOrPremiumDTO freeOrPremium;
  final String duration;
  final bool aiAnalysisEnabled;
  final bool pairModeEnabled;
  final List<TestQuestionDTO> questions;
  final List<TestEvaluationDTO> evaluation;
  final TestRecommendationsDTO recommendations;
  final String widgetType;

  Map<String, dynamic> toJson() => _$TestDTOToJson(this);

  TestDTO copyWith({
    String? id,
    MultiLangStringDTO? title,
    MultiLangStringDTO? level,
    MultiLangStringDTO? description,
    String? type,
    String? categoryId,
    String? categorySlug,
    StatusDTO? status,
    FreeOrPremiumDTO? freeOrPremium,
    String? duration,
    bool? aiAnalysisEnabled,
    bool? pairModeEnabled,
    List<TestQuestionDTO>? questions,
    List<TestEvaluationDTO>? evaluation,
    TestRecommendationsDTO? recommendations,
    String? widgetType,
  }) {
    return TestDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      level: level ?? this.level,
      description: description ?? this.description,
      type: type ?? this.type,
      categoryId: categoryId ?? this.categoryId,
      categorySlug: categorySlug ?? this.categorySlug,
      status: status ?? this.status,
      freeOrPremium: freeOrPremium ?? this.freeOrPremium,
      duration: duration ?? this.duration,
      aiAnalysisEnabled: aiAnalysisEnabled ?? this.aiAnalysisEnabled,
      pairModeEnabled: pairModeEnabled ?? this.pairModeEnabled,
      questions: questions ?? this.questions,
      evaluation: evaluation ?? this.evaluation,
      recommendations: recommendations ?? this.recommendations,
      widgetType: widgetType ?? this.widgetType,
    );
  }
}
