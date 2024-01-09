part of 'base_text_input_bloc.dart';

@freezed
class BaseTextInputState<TInput, TValidatedInput>
    with _$BaseTextInputState<TInput, TValidatedInput> {
  const factory BaseTextInputState.init() =
  BaseTextInputStateInit<TInput, TValidatedInput>;

  const factory BaseTextInputState.validated(TValidatedInput validatedInput) =
  BaseTextInputStateValidated<TInput, TValidatedInput>;

  const factory BaseTextInputState.notValidated(TInput input) =
  BaseTextInputStateNotValidated<TInput, TValidatedInput>;
}
