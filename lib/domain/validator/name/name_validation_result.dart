import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_validation_result.freezed.dart';

@freezed
class NameValidationResult with _$NameValidationResult {
  const NameValidationResult._();

  const factory NameValidationResult.valid({
    required String name,
  }) = NameValid;

  const factory NameValidationResult.tooLong({
    required String name,
    required int maximumCharacters,
  }) = NameTooLong;

  const factory NameValidationResult.tooShort({
    required String name,
    required int minimumCharacters,
  }) = NameTooShort;

  bool get isValid => maybeWhen(
    valid: (_) => true,
    orElse: () => false,
  );
}
