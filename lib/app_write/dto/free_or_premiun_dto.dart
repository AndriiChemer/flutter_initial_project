import 'package:json_annotation/json_annotation.dart';

enum FreeOrPremiumDTO {
  @JsonValue('free')
  free,
  @JsonValue('premium')
  premium,
}

FreeOrPremiumDTO freeOrPremiumFromString(String key) {
  if (key == 'free') {
    return FreeOrPremiumDTO.free;
  } else {
    return FreeOrPremiumDTO.premium;
  }
}

String freeOrPremiumToString(FreeOrPremiumDTO status) {
  return switch (status) {
    FreeOrPremiumDTO.free => 'free',
    FreeOrPremiumDTO.premium => 'premium',
  };
}
