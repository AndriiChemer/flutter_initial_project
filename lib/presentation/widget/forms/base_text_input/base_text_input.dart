import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';

abstract class BaseTextInput<TInput, TValidatedInput,
        TCubit extends BaseTextInputBloc<TInput, TValidatedInput>>
    extends HookWidget {
  const BaseTextInput({
    required this.isRequired,
    required this.revalidator,
    this.focusNode,
    this.initValue,
    this.textInputAction,
    this.onEditingFinished,
    this.onChange,
    super.key,
  });

  final TInput? initValue;
  final Stream? revalidator;
  final ValueChanged<TValidatedInput>? onEditingFinished;
  final ValueChanged<TValidatedInput>? onChange;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final cubit = useBloc<TCubit>();
    final state = useBlocBuilder(cubit);
    final node = focusNode ?? useFocusNode();

    useActionListener<BaseTextInputActions<TValidatedInput>>(
      cubit,
      (actions) => actions.whenOrNull(
        finishEditing: (s) {
          controller.text = controller.text.trim();
          onEditingFinished?.call(s);
        },
      ),
    );

    useEffect(
      () {
        cubit.init(isRequired: isRequired);
        init(cubit);
      },
      [cubit],
    );

    useEffect(
      () {
        final initial = initValue;
        if (initial != null) {
          controller.text = transformInputToString(initial);
          cubit.finishEditing(initial);
        } else if (!isRequired) {
          cubit.finishEditing(initValue ?? transformStringToInput(''));
        }
      },
      [cubit, initValue],
    );

    useEffect(
      () {
        if (revalidator != null) {
          final subscription = revalidator!.listen((event) {
            cubit.finishEditing(transformStringToInput(controller.text.trim()));
          });

          return subscription.cancel;
        }
      },
      [revalidator],
    );

    useEffect(
      () {
        void onFocusChange() {
          if (!node.hasFocus) {
            cubit.finishEditing(transformStringToInput(controller.text.trim()));
          }
        }

        node.addListener(onFocusChange);

        return () => node.removeListener(onFocusChange);
      },
      [node],
    );

    return buildTextField(context, controller, state, cubit, node);
  }

  void init(TCubit cubit) => {};

  String get labelTextWithRequiredSuffix {
    final requiredSuffix =
        isRequired ? LocaleKeys.inputs_common_required_suffix.tr() : '';

    return '$labelText$requiredSuffix';
  }

  // TODO think about it
  // @usedInListView
  Widget buildTextField(
    BuildContext context,
    TextEditingController editingController,
    BaseTextInputState<TInput, TValidatedInput> state,
    covariant BaseTextInputBloc<TInput, TValidatedInput> cubit,
    FocusNode focusNode,
  );

  String get labelText;

  String transformInputToString(TInput input);

  TInput transformStringToInput(String value);
}
