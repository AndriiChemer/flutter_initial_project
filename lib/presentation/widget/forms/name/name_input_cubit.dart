import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validator.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_cubit.dart';

class NameInputCubit extends BaseTextInputCubit<String, NameValidationResult> {
  NameInputCubit(this.nameNameValidator);

  final NameValidator nameNameValidator;

  @override
  NameValidationResult validate(String input) =>
      nameNameValidator(input, isRequired);
}
