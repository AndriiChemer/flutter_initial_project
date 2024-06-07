import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/cubit/user_form_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';

@RoutePage()
class UserFormPage extends HookWidget {
  const UserFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<UserFormBloc>();
    final state = useBlocBuilder(cubit);

    useActionListener<UserFormAction>(
      cubit,
      (action) => _listenAction(action, context),
    );

    useEffect(
      () {
        cubit.init();
      },
      [cubit],
    );

    return FocusScope(
      child: switch (state) {
        UserFormLoading() => const _Loading(),
        UserFormValidated() => _Content(
            state: state,
            cubit: cubit,
          ),
      },
    );
  }

  void _listenAction(
    UserFormAction action,
    BuildContext context,
  ) {
    switch (action) {
      case UserFormScrollToFirstFieldWithError():
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email already is used')));
      case UserFormSaved():
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Success')));
      case UserFormActionError():
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed')));
    }
  }
}

class _Content extends HookWidget {
  const _Content({
    required this.cubit,
    required this.state,
  });

  final UserFormBloc cubit;
  final UserFormValidated state;

  @override
  Widget build(BuildContext context) {
    final nameFocusNode = useFocusNode();
    final surnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(Dimens.twenty),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameInput<NameInputCubit>(
            isRequired: true,
            revalidator: cubit.revalidationRequestStream,
            onEditingFinished: cubit.updateName,
            focusNode: nameFocusNode,
            initValue: state.name,
            textInputAction: TextInputAction.next,
          ),
          const CustomGap.big(),
          NameInput<SurnameInputCubit>(
            isRequired: true,
            revalidator: cubit.revalidationRequestStream,
            onEditingFinished: cubit.updateSurname,
            focusNode: surnameFocusNode,
            initValue: state.surname,
            hint: LocaleKeys.inputs_surname.tr(),
            textInputAction: TextInputAction.next,
          ),
          const CustomGap.big(),
          EmailInput(
            isRequired: true,
            revalidator: cubit.revalidationRequestStream,
            onEditingFinished: cubit.updateEmail,
            initValue: state.email,
            focusNode: emailFocusNode,
            textInputAction: TextInputAction.next,
          ),
          const Spacer(),
          CustomButton.fullWidth(
            title: 'Save',
            action: cubit.onSubmitTap,
          ),
          const CustomGap.xxlg(),
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCircularProgress();
  }
}
