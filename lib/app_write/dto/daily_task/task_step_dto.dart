import 'dart:convert';

import 'package:iteo_libraries_example/app_write/dto/multi_land_string_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_step_dto.g.dart';

@JsonSerializable()
class TaskStepDTO {
  TaskStepDTO({
    required this.number,
    required this.step,
  });

  factory TaskStepDTO.fromJson(Map<String, dynamic> json) {
    final number = json['number'] as int;
    json.removeWhere((key, value) => value is int);

    final map = json.map((key, value) => MapEntry(key, value as String));
    return TaskStepDTO(
      step: MultiLangStringDTO(languages: map),
      number: number,
    );
  }

  factory TaskStepDTO.fromAppWriteJson(String value) {
    final json = jsonDecode(value) as Map<String, dynamic>;
    return TaskStepDTO(
      number: json['number'] as int,
      step: MultiLangStringDTO.fromJson(json['step_json'] as Map<String, dynamic>),
    );
  }

  final int number;
  final MultiLangStringDTO step;

  Map<String, dynamic> toJson() => _$TaskStepDTOToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  String toStringAppWrite() => jsonEncode(toDataBaseJson());

  Map<String, dynamic> toDataBaseJson() => {
        'number': number,
        'step_json': step,
      };
}
