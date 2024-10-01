import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/base_text_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';

class NameInput<CUBIT extends BaseTextInputBloc<String, NameValidationResult>>
    extends BaseTextInput<String, NameValidationResult, CUBIT> {
  const NameInput({
    required super.isRequired,
    this.onChanged,
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
  final void Function()? onChanged;

  @override
  String get labelText => hint ?? LocaleKeys.inputs_name.tr();

  @override
  Widget buildTextField(
    BuildContext context,
    TextEditingController editingController,
    BaseTextInputState<String, NameValidationResult> state,
    BaseTextInputBloc<String, NameValidationResult> cubit,
    FocusNode focusNode,
  ) {
    return CustomTextField(
      focusNode: focusNode,
      controller: editingController,
      autofillHints: const [AutofillHints.givenName],
      labelText: labelTextWithRequiredSuffix,
      autofocus: autofocus,
      errorText: state.getErrorText(context),
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        onChanged?.call();
        cubit.update(transformStringToInput(value));
      },
    );
  }

  @override
  String transformInputToString(String input) => input;

  @override
  String transformStringToInput(String value) => value;
}

extension on BaseTextInputState<String, NameValidationResult> {
  String getErrorText(BuildContext context) {
    return when(
      init: () => '',
      validated: (validationResult) => validationResult.when(
        tooShort: (_, minChars) => LocaleKeys.inputs_common_text_too_short.plural(minChars).tr(),
        tooLong: (_, maxChars) => LocaleKeys.inputs_common_text_too_long.plural(maxChars).tr(),
        valid: (_) => '',
      ),
      notValidated: (_) => '',
    );
  }
}
