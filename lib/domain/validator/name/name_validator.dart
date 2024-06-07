import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';

const firstNameMaxLength = 15;
const firstNameMinLength = 2;

class NameValidator {
  NameValidationResult call(String firstName, bool isRequired) {
    if (isRequired && firstName.length < firstNameMinLength) {
      return NameValidationResult.tooShort(
        name: firstName,
        minChar: firstNameMinLength,
      );
    }
    if (firstName.isEmpty) return NameValidationResult.valid(name: firstName);
    if (firstName.length > firstNameMaxLength) {
      return NameValidationResult.tooLong(
        name: firstName,
        maxChar: firstNameMaxLength,
      );
    }

    return NameValidationResult.valid(name: firstName);
  }
}
