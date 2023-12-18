import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_text_input_actions.freezed.dart';

@freezed
class BaseTextInputActions<Validator>
    with _$BaseTextInputActions<Validator> {
  const factory BaseTextInputActions.finishEditing(
      Validator validator,
  ) = BaseTextInputFinishEditingFieldAction<Validator>;
}
