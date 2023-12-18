import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';

const int emailMaxLength = 64;

/// Defined special characters for email validation:
/// !, #, $, %, &, ', *, +, /, =, ?, ^, {, |, }, ~, -, ., @

/// Allowed characters for email
/// 1) Uppercase and lowercase letters in English (A-Z, a-z)
/// 2) Digits from 0 to 9
/// 3) Special characters
const String _emailAllowedChars = r'''[A-Za-z0-9!.#$%&'*+\/=?^_`{|}\-]+''';

/// Ensures there are no consecutive occurrences of the special characters
const String _noConsecutiveOccurrences =
    r'''(?!.*[.!#$%&'*+\/=?^`{|}~\-@]{2,})''';

/// Ensures there are no special characters at the start
const String _noSpecialCharsStart = r'''(?!^[.!#$%&'*+\/=?^`{|}~\-@])''';

/// Ensures there are no special characters at the end
const String _noSpecialCharsEnd = r'''(?!.*[.!#$%&'*+\/=?^`{|}~\-@]$)''';

/// Ensures there exact one asperand
const String _onlyOneAsperand = r'''[A-Za-z0-9!.#$%&'*+\/=?^_`{|}\-]+@''';

final _emailRegExp = RegExp(
  '^'
  '$_noSpecialCharsStart'
  '$_noSpecialCharsEnd'
  '$_noConsecutiveOccurrences'
  '$_onlyOneAsperand'
  '$_emailAllowedChars'
  r'$',
);

final _allowedCharsRegExp = RegExp(r'''^[A-Za-z0-9!.#$%&'*+\/=?^_`{|}\-@]+$''');

// TODO inject
class EmailValidator {
  EmailValidationResult call(String email, bool isRequired) {
    if (isRequired && email.isEmpty) {
      return EmailValidationResult.empty(email: email);
    }

    if (email.isEmpty) {
      return EmailValidationResult.valid(email: email);
    }

    if (email.length > emailMaxLength) {
      return EmailValidationResult.tooLong(email: email);
    }

    if (!_emailRegExp.hasMatch(email)) {
      if (_allowedCharsRegExp.hasMatch(email)) {
        return EmailValidationResult.wrongFormat(email: email);
      }

      return EmailValidationResult.notAllowedCharacters(email: email);
    }

    return EmailValidationResult.valid(email: email);
  }
}
