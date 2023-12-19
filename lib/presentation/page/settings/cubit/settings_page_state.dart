part of 'settings_page_cubit.dart';

sealed class SettingsPageState {}

class SettingsPageLoading extends SettingsPageState {}

class SettingsPageIdle extends SettingsPageState {
  SettingsPageIdle({
    required this.count,
    required this.title,
  });

  final int count;
  final String title;
}
