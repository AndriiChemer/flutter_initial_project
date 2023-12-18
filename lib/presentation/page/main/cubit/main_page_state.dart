part of 'main_page_cubit.dart';

@freezed
class MainPageState with _$MainPageState {
  @Implements<BuildState>()
  factory MainPageState.initial() = _MainPageStateInitial;

  @Implements<BuildState>()
  factory MainPageState.loading() = _MainPageStateLoading;

  @Implements<BuildState>()
  factory MainPageState.idle({
    required AppThemeType savedAppThemeType,
  }) = _MainPageStateIdle;
}