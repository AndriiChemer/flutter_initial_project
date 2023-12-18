import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/presentation/page/main/widget/email_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/base_text_input.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_state.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_text_field.dart';

class EmailInput extends BaseTextInput<String,
    EmailValidationResult, EmailInputCubit> {
  const EmailInput({
    required super.isRequired,
    super.key,
    super.revalidator,
    super.focusNode,
    super.textInputAction,
    super.onEditingFinished,
    super.initValue,
  });

  @override
  String get labelText => 'Email';

  @override
  Widget buildTextField(
    TextEditingController editingController,
    BaseTextInputState<String, EmailValidationResult> state,
    BaseTextInputCubit<String, EmailValidationResult> cubit,
    FocusNode focusNode,
  ) {
    return CustomTextField(
      controller: editingController,
      autofillHints: const [AutofillHints.email],
      labelText: labelTextWithRequiredSuffix,
      errorText: state.errorText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      onChanged: (value) => cubit.update(transformStringToInput(value)),
      focusNode: focusNode,
    );
  }

  @override
  String transformInputToString(String input) => input;

  @override
  String transformStringToInput(String value) => value;
}

class InPostEmailLiveValidationInput extends BaseTextInput<String,
    EmailValidationResult, EmailInputCubit> {
  const InPostEmailLiveValidationInput({
    required super.isRequired,
    required this.onChanged,
    super.key,
    super.revalidator,
    super.focusNode,
    super.textInputAction,
    super.onEditingFinished,
    super.initValue,
  });

  final void Function(EmailValidationResult) onChanged;

  @override
  String get labelText => 'Input email:';

  @override
  Widget buildTextField(
    TextEditingController editingController,
    BaseTextInputState<String, EmailValidationResult> state,
    EmailInputCubit cubit,
    FocusNode focusNode,
  ) {
    return CustomTextField(
      autocorrect: false,
      controller: editingController,
      autofillHints: const [AutofillHints.email],
      labelText: labelTextWithRequiredSuffix,
      errorText: state.errorText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      onChanged: (value) {
        final result = cubit.changeEmail(transformStringToInput(value));
        if (result != null) {
          onChanged(result);
        }
      },
      focusNode: focusNode,
    );
  }

  @override
  String transformInputToString(String input) => input;

  @override
  String transformStringToInput(String value) => value;
}

extension on BaseTextInputState<String, EmailValidationResult> {
  String get errorText {
    return when(
      init: () => '',
      validated: (validatedEmail) => validatedEmail.when(
        empty: (_) => 'Required field',
        tooLong: (_) => 'Too long',
        wrongFormat: (_) => 'Wrong format',
        notAllowedCharacters: (_) => 'Not allowed characters',
        valid: (_) => '',
      ),
      notValidated: (_) => '',
    );
  }
}
