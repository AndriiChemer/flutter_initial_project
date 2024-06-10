import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/domain/validator/phone/phone_number_validation_result.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/phone/phone_controller.dart';

class PhoneInputWithController extends HookWidget {
  const PhoneInputWithController({
    required this.phoneController,
    this.isRequired = false,
    this.autofocus = false,
    this.onChanged,
    this.hint,
    this.focusNode,
    this.textInputAction,
    super.key,
  });

  final PhoneController phoneController;

  final bool autofocus;
  final bool isRequired;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? hint;
  final void Function()? onChanged;

  String get labelText => hint ?? LocaleKeys.inputs_phone.tr();

  @override
  Widget build(BuildContext context) {
    useListenable(phoneController);
    return CustomTextField(
      isRequired: true,
      onFocusChange: (value) => phoneController.didUpdateFocus(value),
      focusNode: focusNode,
      controller: phoneController.textEditingController,
      autofillHints: const [AutofillHints.givenName],
      labelText: labelText,
      autofocus: autofocus,
      errorText: phoneController.validateResult?.errorMessage,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.words,
    );
  }
}

extension on PhoneNumberValidationResult {
  String? get errorMessage {
    return when(
      valid: (_) => null,
      tooShort: (phoneNumber) => 'Error: too short',
      empty: (phoneNumber) => 'Error: empty',
    );
  }
}
