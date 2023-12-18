import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_state.dart';

class EmailInputCubit
    extends BaseTextInputCubit<String, EmailValidationResult> {
  EmailInputCubit(this.validator);
  final EmailValidator validator;

  @override
  EmailValidationResult validate(String input) {
    return validator(input, isRequired);
  }

  EmailValidationResult? changeEmail(String input) {
    final validatorResult = validate(input);
    final isValid = validatorResult.maybeMap(
      valid: (_) => true,
      orElse: () => false,
    );
    final wasValidatedBefore =
        state.maybeMap(validated: (_) => true, orElse: () => false);

    if (!wasValidatedBefore && !isValid) {
      return null;
    } else {
      emit(BaseTextInputState.validated(validatorResult));

      return validatorResult;
    }
  }
}
