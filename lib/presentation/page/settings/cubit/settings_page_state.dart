part of 'settings_page_cubit.dart';

sealed class SettingsPageState {}

class SettingsPageLoading extends SettingsPageState {}

class SettingsPageIdle extends SettingsPageState {
  SettingsPageIdle({
    required this.savedAppThemeType,
  });

  final AppThemeType savedAppThemeType;
}

class SettingsPageShowError extends SettingsPageState {
  SettingsPageShowError({
    required this.properties,
  });

  final SnackbarProperties properties;
}

class SettingsPageShowWarning extends SettingsPageState {
  SettingsPageShowWarning({
    required this.properties,
  });

  final SnackbarProperties properties;
}
