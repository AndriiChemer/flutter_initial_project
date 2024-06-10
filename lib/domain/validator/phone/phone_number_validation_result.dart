import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_number_validation_result.freezed.dart';

@freezed
class PhoneNumberValidationResult with _$PhoneNumberValidationResult {
  const PhoneNumberValidationResult._(); // coverage:ignore-line

  const factory PhoneNumberValidationResult.valid({
    required String phoneNumber,
  }) = PhoneNumberValid;

  const factory PhoneNumberValidationResult.tooShort({
    required String phoneNumber,
  }) = PhoneNumberTooShort;

  const factory PhoneNumberValidationResult.empty({
    required String phoneNumber,
  }) = PhoneNumberEmpty;

  bool get isValid => maybeWhen(
        valid: (_) => true,
        orElse: () => false,
      );
}
