import 'package:iteo_libraries_example/presentation/widget/cubit/safe_cubit.dart';

part 'settings_page_state.dart';

class SettingsPageCubit extends SafeCubit<SettingsPageState> {
  SettingsPageCubit() : super(SettingsPageLoading());

  int _count = 0;

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      _emitIdle();
    });
  }

  void increase() {
    _count++;
    _emitIdle();
  }

  void _emitIdle() {
    emit(SettingsPageIdle(
      count: _count,
      title: 'Count $_count',
    ));
  }
}
