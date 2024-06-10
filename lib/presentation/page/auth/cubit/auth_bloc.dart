import 'package:equatable/equatable.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_controller.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/phone/phone_controller.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends SafeActionCubit<AuthState, AuthEvent> {
  AuthBloc(
    this.phoneController,
    this.emailController,
  ) : super(const AuthIdle()) {
    phoneController.textChangeListener(_validateFields);
    emailController.textChangeListener(_validateFields);
  }

  final PhoneController phoneController;
  final EmailController emailController;

  bool _isValidField = false;

  Future<void> onSubmitTap() async {
    emit(AuthLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(AuthIdle(_isValidField));
      dispatch(const AuthSuccess());
    });
  }

  void _validateFields() {
    final isValidField = phoneController.isValid && emailController.isValid;
    if (isValidField != _isValidField) {
      _isValidField = isValidField;
      emit(AuthIdle(isValidField));
    }
  }
}
