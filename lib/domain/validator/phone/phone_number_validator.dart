import 'package:iteo_libraries_example/domain/validator/phone/phone_number_validation_result.dart';

final _regExpPhoneNumber = RegExp(r'^[0-9]{9}$');

class PhoneNumberValidator {
  PhoneNumberValidationResult call(String phoneNumber, bool isRequired) {
    if (isRequired && phoneNumber.isEmpty) {
      return PhoneNumberValidationResult.empty(phoneNumber: phoneNumber);
    }
    if (phoneNumber.isEmpty) {
      return PhoneNumberValidationResult.valid(phoneNumber: phoneNumber);
    }
    if (!_regExpPhoneNumber.hasMatch(phoneNumber)) {
      return PhoneNumberValidationResult.tooShort(phoneNumber: phoneNumber);
    }

    return PhoneNumberValidationResult.valid(phoneNumber: phoneNumber);
  }
}
