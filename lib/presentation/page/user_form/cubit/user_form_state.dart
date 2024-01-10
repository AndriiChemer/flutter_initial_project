part of 'user_form_bloc.dart';

sealed class UserFormState {}

class UserFormLoading extends UserFormState {}

class UserFormError extends UserFormState {}

class UserFormValidated extends UserFormState {
  UserFormValidated({
    required this.nameValidationResult,
    required this.name,
    required this.surnameValidationResult,
    required this.surname,
    required this.emailValidationResult,
    required this.email,
    required this.emailLiveValidationResult,
    required this.emailLive,
  });

  final String? name;
  final NameValidationResult? nameValidationResult;
  final String? surname;
  final NameValidationResult? surnameValidationResult;
  final String? email;
  final EmailValidationResult? emailValidationResult;
  final String? emailLive;
  final EmailValidationResult? emailLiveValidationResult;

  bool get isValid => [
    nameValidationResult?.isValid ?? false,
  ].every((isFieldValid) => isFieldValid);
}
