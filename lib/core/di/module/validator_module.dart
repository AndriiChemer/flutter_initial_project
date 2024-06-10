import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validator.dart';
import 'package:iteo_libraries_example/domain/validator/phone/phone_number_validator.dart';

@module
abstract class ValidatorModule {
  @LazySingleton()
  NameValidator get nameValidator;

  @LazySingleton()
  EmailValidator get emailValidator;

  @LazySingleton()
  PhoneNumberValidator get phoneNumberValidator;
}
