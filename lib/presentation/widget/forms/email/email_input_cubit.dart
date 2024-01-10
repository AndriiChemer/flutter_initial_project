import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';

class EmailInputCubit extends BaseTextInputBloc<String, EmailValidationResult> {
  EmailInputCubit(this.emailValidator);

  final EmailValidator emailValidator;

  @override
  EmailValidationResult validate(String input) =>
      emailValidator(input, isRequired);

  EmailValidationResult? changeEmail(String input) {
    final validatorResult = validate(input);
    final isValid = validatorResult.maybeMap(
      valid: (_) => true,
      orElse: () => false,
    );
    final wasValidatedBefore = state.maybeMap(
      validated: (_) => true,
      orElse: () => false,
    );

    if (!wasValidatedBefore && !isValid) {
      return null;
    } else {
      emit(BaseTextInputState.validated(validatorResult));

      return validatorResult;
    }
  }
}
