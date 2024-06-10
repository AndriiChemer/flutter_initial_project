import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_controller.dart';

class EmailInputWithController extends HookWidget {
  const EmailInputWithController({
    required this.emailController,
    this.isRequired = true,
    this.autofocus = false,
    this.onChanged,
    this.hint,
    this.focusNode,
    this.textInputAction,
    super.key,
  });

  final EmailController emailController;

  final bool autofocus;
  final bool isRequired;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? hint;
  final void Function()? onChanged;

  String get labelText => hint ?? LocaleKeys.inputs_email_title.tr();

  @override
  Widget build(BuildContext context) {
    useListenable(emailController);
    return CustomTextField(
      isRequired: isRequired,
      onFocusChange: (value) => emailController.didUpdateFocus(value),
      focusNode: focusNode,
      controller: emailController.textEditingController,
      autofillHints: const [AutofillHints.givenName],
      labelText: labelText,
      autofocus: autofocus,
      errorText: emailController.validateResult?.errorMessage,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.words,
    );
  }
}

extension on EmailValidationResult {
  String? get errorMessage {
    return when(
      valid: (_) => null,
      empty: (phoneNumber) => 'Error: empty',
      tooLong: (email) => 'Error: too tooLong',
      wrongFormat: (email) => 'Error: wrong format',
      notAllowedCharacters: (email) => 'Error: not allowed characters',
    );
  }
}
