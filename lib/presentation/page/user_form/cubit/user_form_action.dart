part of 'user_form_bloc.dart';

sealed class UserFormAction {}

class UserFormScrollToFirstFieldWithError extends UserFormAction {}

class UserFormSaved extends UserFormAction {}

class UserFormActionError extends UserFormAction {}

