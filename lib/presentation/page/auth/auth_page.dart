import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/presentation/page/auth/cubit/auth_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input_with_controller.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/phone/phone_input_with_controller.dart';

@RoutePage()
class AuthPage extends HookWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<AuthBloc>();
    final state = useBlocBuilder(cubit);

    useActionListener<AuthEvent>(
      cubit,
      (action) => _listenAction(action, context),
    );

    return Padding(
      padding: const EdgeInsets.all(Dimens.twenty),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailInputWithController(emailController: cubit.emailController),
          const CustomGap.big(),
          PhoneInputWithController(phoneController: cubit.phoneController),
          const Spacer(),
          switch (state) {
            AuthLoading() => const CustomCircularProgress(),
            AuthIdle() => CustomButton.fullWidth(
                title: 'Log In',
                isActive: state.isActive,
                action: cubit.onSubmitTap,
              ),
          },
          const CustomGap.xxlg(),
        ],
      ),
    );
  }

  void _listenAction(
    AuthEvent action,
    BuildContext context,
  ) {
    switch (action) {
      case AuthSuccess():
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('AuthSuccess')));
      case AuthFailed():
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('AuthFailed')));
      case AuthInvalidField():
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('AuthInvalidField')));
    }
  }
}
