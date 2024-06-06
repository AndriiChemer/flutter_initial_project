part of 'user_form_bloc.dart';

sealed class UserFormState {}

class UserFormLoading extends UserFormState {}

class UserFormValidated extends UserFormState {
  UserFormValidated({
    required this.nameValidationResult,
    required this.name,
    required this.surnameValidationResult,
    required this.surname,
    required this.emailValidationResult,
    required this.email,
  });

  final String? name;
  final NameValidationResult? nameValidationResult;
  final String? surname;
  final NameValidationResult? surnameValidationResult;
  final String? email;
  final EmailValidationResult? emailValidationResult;

  bool get isValid => [
        nameValidationResult?.isValid ?? false,
      ].every((isFieldValid) => isFieldValid);
}
