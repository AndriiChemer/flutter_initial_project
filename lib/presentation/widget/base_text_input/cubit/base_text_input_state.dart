import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_text_input_state.freezed.dart';

@freezed
class BaseTextInputState<Input, Validator>
    with _$BaseTextInputState<Input, Validator> {
  const factory BaseTextInputState.init() =
      BaseTextInputStateInit<Input, Validator>;

  const factory BaseTextInputState.validated(Validator validator) =
      BaseTextInputStateValidated<Input, Validator>;

  const factory BaseTextInputState.notValidated(Input input) =
      BaseTextInputStateNotValidated<Input, Validator>;
}
