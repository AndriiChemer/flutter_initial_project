import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_question_dto.g.dart';

@JsonSerializable()
class TestQuestionDTO {
  TestQuestionDTO({
    required this.id,
    required this.testId,
    required this.question,
    required this.options,
  });

  factory TestQuestionDTO.fromJson(Map<String, dynamic> json) => _$TestQuestionDTOFromJson(json);

  factory TestQuestionDTO.fromJsonWithTestId(Map<String, dynamic> json, String testId) => TestQuestionDTO(
        id: json['id'] as String,
        question: MultiLangStringDTO.fromJson(json['question'] as Map<String, dynamic>),
        options:
            (json['options'] as List<dynamic>).map((e) => TestOptionDTO.fromJson(e as Map<String, dynamic>)).toList(),
        testId: testId,
      );

  factory TestQuestionDTO.fromAppWriteJson(Map<String, dynamic> json) => TestQuestionDTO(
        id: json['id'] as String,
        question: MultiLangStringDTO.fromStringJson(json['question_json'] as String),
        testId: (json['test_id'] as Map<String, dynamic>)['id'] as String,
        options: (json['options_json_array'] as List<dynamic>)
            .map((e) => TestOptionDTO.fromStringJson(e as String))
            .toList(),
      );

  final String id;
  @JsonKey(name: 'test_id')
  final String testId;
  final MultiLangStringDTO question;
  final List<TestOptionDTO> options;

  Map<String, dynamic> toJson() => _$TestQuestionDTOToJson(this);

  Map<String, dynamic> toDataBaseJson() => {
        'id': id,
        'question_json': question.toString(),
        'options_json_array': options.map((option) => option.toString()).toList(),
        'test_id': 'test_id',
      };
}

@JsonSerializable()
class TestOptionDTO {
  TestOptionDTO({
    required this.id,
    required this.text,
    required this.score,
  });

  factory TestOptionDTO.fromJson(Map<String, dynamic> json) => _$TestOptionDTOFromJson(json);

  factory TestOptionDTO.fromStringJson(String json) {
    final nameJson = jsonDecode(json) as Map<String, dynamic>;
    return TestOptionDTO.fromJson(nameJson);
  }

  final String id;
  final Map<String, String> text;
  final int score;

  Map<String, dynamic> toJson() => _$TestOptionDTOToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
