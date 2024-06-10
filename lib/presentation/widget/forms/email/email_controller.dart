import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/presentation/widget/input/controller/custom_input_controller.dart';

class EmailController extends CustomInputController {
  EmailController(this.emailValidator);

  final EmailValidator emailValidator;
  EmailValidationResult? validateResult;

  @override
  String get text => textEditingController.text;

  @override
  bool get isValid => emailValidator.call(text, true) is EmailValid;

  @override
  void validate() {
    validateResult = emailValidator.call(text, true);
    notifyListeners();
  }

  @override
  void resetError() {
    validateResult = null;
    notifyListeners();
  }
}
