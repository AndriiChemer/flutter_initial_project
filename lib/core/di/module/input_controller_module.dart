import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_controller.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/phone/phone_controller.dart';

@module
abstract class InputControllerModule {
  @injectable
  PhoneController get phoneController;

  @injectable
  EmailController get emailController;
}
