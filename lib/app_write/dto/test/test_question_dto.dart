import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_question_dto.g.dart';

@JsonSerializable()
class TestQuestionDTO {
  TestQuestionDTO({
    required this.id,
    required this.question,
    required this.options,
  });

  factory TestQuestionDTO.fromJson(Map<String, dynamic> json) => _$TestQuestionDTOFromJson(json);

  final String id;
  final MultiLangStringDTO question;
  final List<TestOptionDTO> options;

  Map<String, dynamic> toJson() => _$TestQuestionDTOToJson(this);
}

@JsonSerializable()
class TestOptionDTO {
  TestOptionDTO({
    required this.id,
    required this.text,
    required this.score,
  });

  factory TestOptionDTO.fromJson(Map<String, dynamic> json) => _$TestOptionDTOFromJson(json);
  final String id;
  final Map<String, String> text;
  final int score;

  Map<String, dynamic> toJson() => _$TestOptionDTOToJson(this);
}
