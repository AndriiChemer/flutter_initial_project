import 'package:iteo_libraries_example/domain/validator/phone/phone_number_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/phone/phone_number_validator.dart';
import 'package:iteo_libraries_example/presentation/widget/input/controller/custom_input_controller.dart';

class PhoneController extends CustomInputController {
  PhoneController(this.phoneNumberValidator);

  final PhoneNumberValidator phoneNumberValidator;
  PhoneNumberValidationResult? validateResult;

  @override
  String get text => textEditingController.text;

  @override
  bool get isValid => phoneNumberValidator.call(text, true) is PhoneNumberValid;

  @override
  void validate() {
    validateResult = phoneNumberValidator.call(text, true);
    notifyListeners();
  }

  @override
  void resetError() {
    validateResult = null;
    notifyListeners();
  }
}
