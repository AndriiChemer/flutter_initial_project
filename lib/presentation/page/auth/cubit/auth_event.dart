part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class AuthSuccess extends AuthEvent {
  const AuthSuccess();
}

class AuthFailed extends AuthEvent {
  const AuthFailed();
}

class AuthInvalidField extends AuthEvent {
  const AuthInvalidField();
}
