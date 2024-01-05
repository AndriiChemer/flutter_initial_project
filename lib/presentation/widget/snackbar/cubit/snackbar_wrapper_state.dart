part of 'snackbar_wrapper_cubit.dart';

sealed class SnackbarWrapperState {}

class SnackbarWrapperIdle extends SnackbarWrapperState {}

class SnackbarWrapperShowInfo extends SnackbarWrapperState {
  SnackbarWrapperShowInfo(this.properties);

  final SnackbarProperties properties;
}

class SnackbarWrapperShowError extends SnackbarWrapperState {
  SnackbarWrapperShowError(this.properties);

  final SnackbarProperties properties;
}
