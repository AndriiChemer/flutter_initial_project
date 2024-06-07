import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/base_text_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';

class NameInput
    extends BaseTextInput<String, NameValidationResult, NameInputCubit> {
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
    if (context.isFlutterTest) {
      return when(
        init: () => '',
        validated: (validationResult) => validationResult.when(
          tooShort: (_, minChars) =>
              'The field should contain at least $minChars characters',
          tooLong: (_, maxChars) =>
              'The field should contain a maximum of  $maxChars characters',
          valid: (_) => '',
        ),
        notValidated: (_) => '',
      );
    }
    return when(
      init: () => '',
      validated: (validationResult) => validationResult.when(
        tooShort: (_, minChars) =>
            LocaleKeys.inputs_common_text_too_short.plural(minChars).tr(),
        tooLong: (_, maxChars) =>
            LocaleKeys.inputs_common_text_too_long.plural(maxChars).tr(),
        valid: (_) => '',
      ),
      notValidated: (_) => '',
    );
  }
}
