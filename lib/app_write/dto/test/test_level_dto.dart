import 'package:json_annotation/json_annotation.dart';

enum TestLevelDTO {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high;

  static TestLevelDTO fromString(String key) {
    return switch (key.toLowerCase()) {
      'low' => TestLevelDTO.low,
      'medium' => TestLevelDTO.medium,
      'high' => TestLevelDTO.high,
      _ => TestLevelDTO.medium,
    };
  }

  static String mapToString(TestLevelDTO level) {
    return level.name.toLowerCase();
  }

  static TestLevelDTO mapFromJsonString(String key) {
    return switch (key.toLowerCase()) {
      'low' || 'easy' => TestLevelDTO.low,
      'medium' || 'intermediate' || 'for all' => TestLevelDTO.medium,
      'high' || 'advanced' || 'deep' || 'for couples in crisis' => TestLevelDTO.high,
      _ => TestLevelDTO.medium,
    };
  }
}
