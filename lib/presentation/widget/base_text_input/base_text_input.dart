import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_actions.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/base_text_input/cubit/base_text_input_state.dart';

abstract class BaseTextInput<Input, ValidatedInput,
  TCubit extends BaseTextInputCubit<Input, ValidatedInput>>  extends HookWidget {
  const BaseTextInput({
    required this.isRequired,
    required this.revalidator,
    super.key,
    this.onChange,
    this.initValue,
    this.focusNode,
    this.textInputAction,
    this.onEditingFinished,
  });

  final Input? initValue;
  final Stream? revalidator;
  final ValueChanged<ValidatedInput>? onEditingFinished;
  final ValueChanged<ValidatedInput>? onChange;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final cubit = useBloc<TCubit>();
    final state = useBlocBuilder(cubit);
    final node = focusNode ?? useFocusNode();

    useActionListener<BaseTextInputActions<ValidatedInput>>(
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

    return buildTextField(controller, state, cubit, node);
  }

  void init(TCubit cubit) => {};

  String get labelTextWithRequiredSuffix {
    final requiredSuffix = isRequired ? '*' : '';
    return '$labelText$requiredSuffix';
  }

  // @usedInListView
  Widget buildTextField(
    TextEditingController editingController,
    BaseTextInputState<Input, ValidatedInput> state,
    covariant BaseTextInputCubit<Input, ValidatedInput> cubit,
    FocusNode focusNode,
  );

  String get labelText;

  String transformInputToString(Input input);

  Input transformStringToInput(String value);
}
