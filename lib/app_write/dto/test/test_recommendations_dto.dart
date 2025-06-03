import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_recommendations_dto.g.dart';

@JsonSerializable()
class TestRecommendationsDTO {
  TestRecommendationsDTO({
    required this.individual,
    required this.couple,
  });

  factory TestRecommendationsDTO.fromJson(Map<String, dynamic> json) => _$TestRecommendationsDTOFromJson(json);
  final MultiLangStringDTO individual;
  final MultiLangStringDTO couple;

  Map<String, dynamic> toJson() => _$TestRecommendationsDTOToJson(this);
}
