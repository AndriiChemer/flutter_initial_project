import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_evaluation_dto.g.dart';

@JsonSerializable()
class TestEvaluationDTO {
  TestEvaluationDTO({
    required this.range,
    required this.title,
    required this.description,
  });

  factory TestEvaluationDTO.fromJson(Map<String, dynamic> json) => _$TestEvaluationDTOFromJson(json);

  factory TestEvaluationDTO.fromStringJson(String json) {
    final nameJson = jsonDecode(json) as Map<String, dynamic>;
    return TestEvaluationDTO.fromJson(nameJson);
  }

  final List<int> range;
  final MultiLangStringDTO title;
  final MultiLangStringDTO description;

  Map<String, dynamic> toJson() => _$TestEvaluationDTOToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
