import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'base_text_input_actions.dart';
part 'base_text_input_state.dart';
part 'base_text_input_bloc.freezed.dart';

abstract class BaseTextInputBloc<TInput, TValidatedInput>
    extends SafeActionCubit<BaseTextInputState<TInput, TValidatedInput>,
        BaseTextInputActions<TValidatedInput>> {
  BaseTextInputBloc() : super(const BaseTextInputState.init());

  late final bool isRequired;

  TValidatedInput validate(TInput input);

  void init({required bool isRequired}) {
    this.isRequired = isRequired;
  }

  void update(TInput input) {
    emit(BaseTextInputState.notValidated(input));
  }

  void validateAndUpdate(TInput input) {
    final TValidatedInput validatedInput = validate(input);
    emit(BaseTextInputState.validated(validatedInput));
  }

  TValidatedInput validateWithResult(TInput input) {
    final TValidatedInput validatedInput = validate(input);
    emit(BaseTextInputState.validated(validatedInput));

    return validatedInput;
  }

  void finishEditing(TInput input) {
    final TValidatedInput validatedInput = validate(input);
    dispatch(BaseTextInputActions.finishEditing(validatedInput));
    emit(BaseTextInputState.validated(validatedInput));
  }
}
