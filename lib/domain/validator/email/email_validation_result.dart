import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_validation_result.freezed.dart';

@freezed
class EmailValidationResult with _$EmailValidationResult {
  const EmailValidationResult._();

  const factory EmailValidationResult.valid({
    required String email,
  }) = EmailValid;

  const factory EmailValidationResult.tooLong({
    required String email,
  }) = EmailTooLong;

  const factory EmailValidationResult.wrongFormat({
    required String email,
  }) = EmailWrongFormat;

  const factory EmailValidationResult.notAllowedCharacters({
    required String email,
  }) = EmailNotAllowedCharacters;

  const factory EmailValidationResult.empty({
    required String email,
  }) = EmailEmpty;

  bool get isValid => maybeWhen(
        valid: (_) => true,
        orElse: () => false,
      );
}
