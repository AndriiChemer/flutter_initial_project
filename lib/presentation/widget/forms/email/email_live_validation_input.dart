import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/base_text_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input_cubit.dart';

class EmailLiveValidationInput extends BaseTextInput<String, EmailValidationResult, EmailInputCubit> {
  const EmailLiveValidationInput({
    required super.isRequired,
    required this.onChanged,
    this.hint,
    this.autofocus = false,
    super.onEditingFinished,
    super.textInputAction,
    super.revalidator,
    super.focusNode,
    super.initValue,
    super.key,
  });

  final bool autofocus;
  final String? hint;
  final void Function(EmailValidationResult) onChanged;

  @override
  String get labelText => LocaleKeys.inputs_email_title.tr();

  @override
  Widget buildTextField(
    TextEditingController editingController,
    BaseTextInputState<String, EmailValidationResult> state,
    EmailInputCubit cubit,
    FocusNode focusNode,
  ) {
    return CustomTextField(
      focusNode: focusNode,
      controller: editingController,
      autofillHints: const [AutofillHints.email],
      labelText: labelTextWithRequiredSuffix,
      autofocus: autofocus,
      errorText: state.errorText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        final result = cubit.changeEmail(transformStringToInput(value));
        if (result != null) {
          onChanged(result);
        }
      },
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
        empty: (_) => LocaleKeys.inputs_common_empty.tr(),
        tooLong: (_) => LocaleKeys.inputs_email_validation_wrong_format.tr(),
        wrongFormat: (_) =>
            LocaleKeys.inputs_email_validation_wrong_format.tr(),
        notAllowedCharacters: (_) =>
            LocaleKeys.inputs_email_validation_not_allowed_characters.tr(),
        valid: (_) => '',
      ),
      notValidated: (_) => '',
    );
  }
}
