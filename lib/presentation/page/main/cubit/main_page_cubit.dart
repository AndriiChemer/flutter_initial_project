import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';

part 'main_page_state.dart';
part 'main_page_cubit.freezed.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(
    this._saveAppThemeType,
    this._getAppThemeTypeStream,
  ) : super(MainPageState.initial()) {
    _appThemeTypeSubscription =
        _getAppThemeTypeStream().listen(_onAppThemeTypeChanged);
  }

  final SaveAppThemeTypeUseCase _saveAppThemeType;
  final GetAppThemeTypeStreamUseCase _getAppThemeTypeStream;
  StreamSubscription? _appThemeTypeSubscription;

  Future<void> setAppThemeType(AppThemeType? type) async {
    if(type == null) return;
    try {
      await _saveAppThemeType(type);
    } catch (e, s) {
      // TODO error
      // Log.e('$runtimeType - setAppThemeType error', LogTag.cubit, e, s);
    }
  }

  void _onAppThemeTypeChanged(AppThemeType type) {
    print('ANDRII listen: $type');
    emit(MainPageState.idle(savedAppThemeType: type));
  }

  @override
  Future<void> close() {
    _appThemeTypeSubscription?.cancel();
    _appThemeTypeSubscription = null;

    return super.close();
  }
}
