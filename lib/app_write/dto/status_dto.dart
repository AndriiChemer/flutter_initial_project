import 'package:json_annotation/json_annotation.dart';

enum StatusDTO {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
}

StatusDTO statusFromString(String key) {
  if (key == 'active') {
    return StatusDTO.active;
  } else {
    return StatusDTO.inactive;
  }
}

String statusToString(StatusDTO status) {
  return switch (status) {
    StatusDTO.active => 'active',
    StatusDTO.inactive => 'inactive',
  };
}
