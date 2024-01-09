part of 'base_text_input_bloc.dart';

@freezed
class BaseTextInputActions<TValidatedInput>
    with _$BaseTextInputActions<TValidatedInput> {
  const factory BaseTextInputActions.finishEditing(
    TValidatedInput validatedInput,
  ) = BaseTextInputFinishEditingFieldAction<TValidatedInput>;
}