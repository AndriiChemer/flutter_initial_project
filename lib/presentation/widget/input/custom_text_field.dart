import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_text.dart';
import 'package:iteo_libraries_example/presentation/widget/error_info.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/animation_durations.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/dimens.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialText,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.counterDisabled = false,
    this.labelText,
    this.prefixText,
    this.errorText,
    this.prefixIcon,
    this.prefix,
    this.hintText,
    this.prefixIconPadding = Spacings.zero,
    this.suffixIcon,
    this.suffixIconPadding,
    this.autofocus = false,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.autofillHints,
    this.maxLength,
    this.maxLines,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.labelStyle,
    this.floatingLabelBehavior,
    this.contentPadding,
    this.errorBorderEnabled = true,
    bool? autocorrect,
  }) : autocorrect = autocorrect ?? true;

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? initialText;
  final bool enabled;
  final bool readOnly;
  final bool counterDisabled;
  final String? labelText;
  final String? prefixText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? hintText;
  final double prefixIconPadding;
  final Widget? suffixIcon;
  final double? suffixIconPadding;
  final bool autofocus;
  final int? maxLines;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onEditingComplete;
  final void Function(String)? onSubmitted;
  final int? maxLength;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final EdgeInsets? contentPadding;
  final bool autocorrect;
  final bool errorBorderEnabled;

  EdgeInsets get suffixIconEndPadding =>
      EdgeInsets.only(right: suffixIconPadding ?? Spacings.md);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typo = context.typo;
    final controller = this.controller ?? useTextEditingController();
    final focusNode = useListenable(this.focusNode ?? useFocusNode());
    final inputBorder = useMemoized(
      () {
        if (!enabled) {
          return _InputBorder(color: colors.border_50, width: Dimens.one);
        }
        if (errorText?.isNotEmpty ?? false) {
          if (errorBorderEnabled) {
            return _InputBorder(color: colors.error, width: Dimens.borderWidth);
          } else {
            return _InputBorder(color: colors.typo, width: Dimens.one);
          }
        }
        if (focusNode.hasFocus) {
          return _InputBorder(color: colors.typo, width: Dimens.borderWidth);
        }
        if (controller.text.isEmpty) {
          return _InputBorder(color: colors.border, width: Dimens.one);
        }

        return _InputBorder(color: colors.subtypo, width: Dimens.one);
      },
      [
        enabled,
        focusNode.hasFocus,
        controller.text,
        errorText,
      ],
    );

    useEffect(
      () {
        if (initialText != null) {
          controller.text = initialText!;
        }
      },
      [initialText],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          type: MaterialType.transparency,
          child: TextField(
            autocorrect: autocorrect,
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            autofillHints: autofillHints,
            autofocus: autofocus,
            keyboardAppearance: colors.brightness,
            enabled: enabled,
            readOnly: readOnly,
            cursorColor: colors.typo,
            maxLength: maxLength,
            maxLines: maxLines,
            style: style ??
                typo.f15w500.copyWith(
                  color: enabled ? context.colors.typo : context.colors.subtypo,
                ),
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete == null
                ? null
                : () => onEditingComplete!(controller.text),
            onSubmitted: onSubmitted,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              enabled: enabled,
              hintStyle: typo.f15w500.copyWith(color: colors.subtypo),
              labelStyle: typo.f15w500.copyWith(color: colors.subtypo),
              labelText: labelText,
              floatingLabelStyle:
                  labelStyle ?? typo.f12w500.copyWith(color: colors.subtypo),
              floatingLabelBehavior: floatingLabelBehavior,
              prefix: (prefixText?.isNotEmpty ?? false)
                  ? _PrefixText(prefixText: prefixText!)
                  : prefix,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(prefixIconPadding),
                      child: prefixIcon,
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? _SuffixIcon(
                      suffixIcon: suffixIcon,
                      padding: suffixIconEndPadding,
                    )
                  : null,
              alignLabelWithHint: true,
              contentPadding:
                  contentPadding ?? const EdgeInsets.only(left: Spacings.md),
              errorBorder: inputBorder,
              focusedBorder: inputBorder,
              hintText: hintText,
              focusedErrorBorder: inputBorder,
              disabledBorder: inputBorder,
              enabledBorder: inputBorder,
              border: inputBorder,
              counterStyle: TextStyle(color: colors.typo),
              counterText: counterDisabled
                  ? ''
                  : null, // Empty phrase disables default counter
            ),
          ),
        ),
        if (errorText?.isNotEmpty ?? false) ...[
          ErrorInfo(error: errorText!),
        ],
      ],
    );
  }
}

class _InputBorder extends OutlineInputBorder {
  _InputBorder({
    required Color color,
    required double width,
  }) : super(
          borderSide: BorderSide(color: color, width: width),
          borderRadius: const BorderRadius.all(Radius.circular(Spacings.xsm)),
        );
}

class _PrefixText extends StatelessWidget {
  const _PrefixText({
    required this.prefixText,
  });

  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Spacings.xsm),
      child: CustomText.f15w600(
        prefixText,
        color: context.colors.subtypo,
      ),
    );
  }
}

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon({
    required this.suffixIcon,
    this.padding = EdgeInsets.zero,
  });

  final Widget? suffixIcon;
  final EdgeInsets padding;

  bool get _isVisible => suffixIcon != null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AnimationDurations.mid,
      child: _isVisible
          ? Padding(
              padding: padding,
              child: suffixIcon,
            )
          : const SizedBox.shrink(),
    );
  }
}
