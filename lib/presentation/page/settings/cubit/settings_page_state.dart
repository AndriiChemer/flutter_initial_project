part of 'settings_page_cubit.dart';

sealed class SettingsPageState {}

class SettingsPageLoading extends SettingsPageState {}

class SettingsPageIdle extends SettingsPageState {
  SettingsPageIdle({
    required this.savedAppThemeType,
  });

  final AppThemeType savedAppThemeType;
}
