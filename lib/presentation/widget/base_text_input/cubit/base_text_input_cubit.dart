import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_actions.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_state.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

abstract class BaseTextInputCubit<Input, Validator>
    extends SafeActionCubit<BaseTextInputState<Input, Validator>,
        BaseTextInputActions<Validator>> {
  BaseTextInputCubit() : super(const BaseTextInputState.init());

  late final bool isRequired;

  Validator validate(Input input);

  void init({required bool isRequired}) {
    this.isRequired = isRequired;
  }

  void update(Input input) {
    emit(BaseTextInputState.notValidated(input));
  }

  void validateAndUpdate(Input input) {
    final Validator validatedInput = validate(input);
    emit(BaseTextInputState.validated(validatedInput));
  }

  Validator validateWithResult(Input input) {
    final Validator validatedInput = validate(input);
    emit(BaseTextInputState.validated(validatedInput));

    return validatedInput;
  }

  void finishEditing(Input input) {
    final Validator validatedInput = validate(input);
    dispatch(BaseTextInputActions.finishEditing(validatedInput));
    emit(BaseTextInputState.validated(validatedInput));
  }
}
