import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validator.dart';

Future<void> injectValidatorModule(GetIt getIt) async {
  getIt.registerLazySingleton<NameValidator>(() => NameValidator());
  getIt.registerLazySingleton<EmailValidator>(() => EmailValidator());
}
