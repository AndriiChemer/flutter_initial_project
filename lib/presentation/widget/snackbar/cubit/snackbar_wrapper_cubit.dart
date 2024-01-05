import 'dart:async';

import 'package:iteo_libraries_example/presentation/widget/cubit/safe_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/snackbar_properties.f.dart';

part 'snackbar_wrapper_state.dart';

class SnackbarWrapperCubit extends SafeCubit<SnackbarWrapperState> {
  SnackbarWrapperCubit() : super(SnackbarWrapperIdle());

  Timer? _timer;

  void showInfoSnackbar(SnackbarProperties properties) {
    emit(SnackbarWrapperShowInfo(properties));
    _scheduleSnackbarClose(properties.visibilityDuration);
  }

  void showErrorSnackbar(SnackbarProperties properties) {
    emit(SnackbarWrapperShowError(properties));
    _scheduleSnackbarClose(properties.visibilityDuration);
  }

  void _scheduleSnackbarClose(Duration visibilityDuration) {
    _timer?.cancel();
    _timer = Timer(visibilityDuration, closeSnackbar);
  }

  void closeSnackbar() {
    emit(SnackbarWrapperIdle());
  }

  @override
  Future<void> close() {
    _timer?.cancel();

    return super.close();
  }
}
