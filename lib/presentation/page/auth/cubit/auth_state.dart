part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthIdle extends AuthState {
  const AuthIdle([this.isActive = false]);

  final bool isActive;

  @override
  List<Object> get props => [isActive];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}
