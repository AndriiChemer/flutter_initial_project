import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/dto/appwrite_converter.dart';
import 'package:iteo_libraries_example/app_write/dto/free_or_premiun_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/status_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_evaluation_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_level_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_question_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_recommendations_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TestDTO implements AppwriteConverter {
  TestDTO({
    required this.id,
    required this.slug,
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

  factory TestDTO.fromJson1(Map<String, dynamic> json) => _$TestDTOFromJson(json);

  factory TestDTO.fromJson(Map<String, dynamic> json) => TestDTO(
        id: json['id'] as String,
        slug: json['id'] as String,
        title: MultiLangStringDTO.fromJson(json['title'] as Map<String, dynamic>),
        level: TestLevelDTO.mapFromJsonString(
            MultiLangStringDTO.fromJson(json['level'] as Map<String, dynamic>).languages.entries.last.value),
        description: MultiLangStringDTO.fromJson(json['description'] as Map<String, dynamic>),
        type: json['type'] as String,
        categoryId: json['category_id'] as String,
        categorySlug: json['category_slug'] as String,
        status: $enumDecode(_$StatusDTOEnumMap, json['status']),
        freeOrPremium: $enumDecode(_$FreeOrPremiumDTOEnumMap, json['free_or_premium']),
        duration: json['duration'] as String,
        aiAnalysisEnabled: json['ai_analysis_enabled'] as bool,
        pairModeEnabled: json['pair_mode_enabled'] as bool,
        questions: (json['questions'] as List<dynamic>)
            .mapIndexed((index, e) =>
                TestQuestionDTO.fromJsonWithTestId(e as Map<String, dynamic>, json['id'] as String, index + 1))
            .toList(),
        evaluation: (json['evaluation'] as List<dynamic>)
            .map((e) => TestEvaluationDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        recommendations: TestRecommendationsDTO.fromJson(json['recommendations'] as Map<String, dynamic>),
        widgetType: json['widget_type'] as String?,
      );

  factory TestDTO.fromAppWriteJson(Map<String, dynamic> json) => TestDTO(
        id: json['id'] as String,
        slug: json['slug'] as String,
        title: MultiLangStringDTO.fromStringJson(json['title_json'] as String),
        description: MultiLangStringDTO.fromStringJson(json['description_json'] as String),
        type: json['type'] as String,
        duration: json['duration'] as String,
        categoryId: (json['category_id'] as Map<String, dynamic>)['id'] as String,
        categorySlug: json['category_slug'] as String,
        status: $enumDecode(_$StatusDTOEnumMap, json['status']),
        widgetType: json['widget_type'] as String?,
        freeOrPremium: $enumDecode(_$FreeOrPremiumDTOEnumMap, json['free_or_premium']),
        aiAnalysisEnabled: json['ai_analysis_enabled'] as bool,
        pairModeEnabled: json['pair_mode_enabled'] as bool,
        evaluation: (json['evaluation_json_array'] as List<dynamic>)
            .map((e) => TestEvaluationDTO.fromStringJson(e as String))
            .toList(),
        recommendations: TestRecommendationsDTO.fromStringJson(json['recommendations_json'] as String),
        level: TestLevelDTO.fromString(json['level'] as String),
        questions: [],
      );

  final String id;
  final String slug;
  final MultiLangStringDTO title;
  final TestLevelDTO level;
  final MultiLangStringDTO description;
  final String type;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'category_slug')
  final String categorySlug;
  final StatusDTO status;
  @JsonKey(name: 'free_or_premium')
  final FreeOrPremiumDTO freeOrPremium;
  final String duration;
  @JsonKey(name: 'ai_analysis_enabled')
  final bool aiAnalysisEnabled;
  @JsonKey(name: 'pair_mode_enabled')
  final bool pairModeEnabled;
  final List<TestQuestionDTO> questions;
  final List<TestEvaluationDTO> evaluation;
  final TestRecommendationsDTO recommendations;
  @JsonKey(name: 'widget_type')
  final String? widgetType;

  Map<String, dynamic> toJson() => _$TestDTOToJson(this);

  @override
  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'slug': slug,
        'title_json': title.toString(),
        'level': level.name,
        'description_json': description.toString(),
        'type': type,
        'category_id': categoryId,
        'category_slug': categorySlug,
        'status': _$StatusDTOEnumMap[status],
        'free_or_premium': _$FreeOrPremiumDTOEnumMap[freeOrPremium],
        'duration': duration,
        'ai_analysis_enabled': aiAnalysisEnabled,
        'pair_mode_enabled': pairModeEnabled,
        'evaluation_json_array': evaluation.map((e) => e.toString()).toList(),
        'recommendations_json': recommendations.toString(),
        'widget_type': widgetType,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

  TestDTO copyWith({
    String? id,
    String? slug,
    MultiLangStringDTO? title,
    MultiLangStringDTO? description,
    TestLevelDTO? level,
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
      slug: slug ?? this.slug,
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
