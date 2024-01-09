part of 'user_form_bloc.dart';

sealed class UserFormState {}

class UserFormLoading extends UserFormState {}

class UserFormError extends UserFormState {}

class UserFormValidated extends UserFormState {
  UserFormValidated({
    required this.nameValidationResult,
    required this.name,
  });

  final String? name;
  final NameValidationResult? nameValidationResult;

  bool get isValid => [
    nameValidationResult?.isValid ?? false,
  ].every((isFieldValid) => isFieldValid);
}
