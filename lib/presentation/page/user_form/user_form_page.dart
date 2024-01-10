import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/cubit/user_form_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_live_validation_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/dimens.dart';

@RoutePage()
class UserFormPage extends HookWidget {
  const UserFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final cubit = useBloc<UserFormBloc>();
    final state = useBlocBuilder(cubit);

    useActionListener<UserFormAction>(
      cubit, (action) {
        // action.whenOrNull(
        //   error: () => snackbarController.showUnknownError(),
        //   savingErrorEmailAlreadyInUse: () => snackbarController.showError(
        //     SnackbarProperties(LocaleKeys.email_already_in_use.tr()),
        //   ),
        //   saved: () => context.router.popForced(
        //     YourDataFormResult.success,
        //   ),
        // );
      },
    );

    // useBlocListener<YourDataFormCubit, YourDataFormState>(
    //   cubit,
    //       (_, state, __) {
    //     state.mapOrNull(
    //       validated: (state) {
    //         if (state.isSaving) {
    //           snackbarController.close();
    //         }
    //       },
    //     );
    //   },
    // );

    useEffect(() {
        cubit.init();
      },
      [cubit],
    );

    return FocusScope(
      child: switch(state) {
        UserFormLoading() => _Loading(),
        UserFormError() => _Error(),
        UserFormValidated() => _Content(
          state: state,
          scrollController: scrollController,
          cubit: cubit,
        ),
      },
    );
  }
}

class _Content extends HookWidget {
  const _Content({
    required this.cubit,
    required this.state,
    required this.scrollController,
    super.key,
  });

  final UserFormBloc cubit;
  final UserFormValidated state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final nameFocusNode = useFocusNode();
    final surnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final emailLiveFocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(Dimens.twenty),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameInput(
            isRequired: true,
            revalidator: cubit.revalidationRequestStream,
            onEditingFinished: cubit.updateName,
            focusNode: nameFocusNode,
            initValue: state.name,
            textInputAction: TextInputAction.next,
          ),
          const CustomGap.big(),
          NameInput(
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
          const CustomGap.big(),
          EmailLiveValidationInput(
            isRequired: true,
            revalidator: cubit.revalidationRequestStream,
            initValue: state.emailLive,
            focusNode: emailLiveFocusNode,
            textInputAction: TextInputAction.next,
            onChanged: cubit.liveUpdateEmail,
          ),
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Error extends StatelessWidget {
  const _Error({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


