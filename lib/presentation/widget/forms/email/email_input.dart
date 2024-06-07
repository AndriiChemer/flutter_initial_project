import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/base_text_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input_cubit.dart';

class EmailInput
    extends BaseTextInput<String, EmailValidationResult, EmailInputCubit> {
  const EmailInput({
    required super.isRequired,
    this.autofocus = false,
    super.onEditingFinished,
    super.textInputAction,
    super.revalidator,
    super.focusNode,
    super.initValue,
    super.key,
  });

  final bool autofocus;

  @override
  String get labelText => LocaleKeys.inputs_email_title.tr();

  @override
  Widget buildTextField(
    BuildContext context,
    TextEditingController editingController,
    BaseTextInputState<String, EmailValidationResult> state,
    BaseTextInputBloc<String, EmailValidationResult> cubit,
    FocusNode focusNode,
  ) {
    return CustomTextField(
      focusNode: focusNode,
      controller: editingController,
      autofillHints: const [AutofillHints.email],
      labelText: labelTextWithRequiredSuffix,
      autofocus: autofocus,
      errorText: state.getErrorText(context),
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => cubit.update(transformStringToInput(value)),
    );
  }

  @override
  String transformInputToString(String input) => input;

  @override
  String transformStringToInput(String value) => value;
}

extension on BaseTextInputState<String, EmailValidationResult> {
  String getErrorText(BuildContext context) {
    // if(context.isFlutterTest) {
    //   return when(
    //     init: () => '',
    //     validated: (validatedEmail) => validatedEmail.when(
    //       empty: (_) => 'Required fields',
    //       tooLong: (_) => LocaleKeys.inputs_email_validation_wrong_format.tr(),
    //       wrongFormat: (_) =>
    //           LocaleKeys.inputs_email_validation_wrong_format.tr(),
    //       notAllowedCharacters: (_) =>
    //           LocaleKeys.inputs_email_validation_not_allowed_characters.tr(),
    //       valid: (_) => '',
    //     ),
    //     notValidated: (_) => '',
    //   )
    // }

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
