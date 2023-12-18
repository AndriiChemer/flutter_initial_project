import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

abstract class SafeCubit<State> extends Cubit<State> {
  SafeCubit(super.initialState);

  @protected
  @visibleForTesting
  @override
  void emit(State state) {
    if (isClosed) {
      // TODO add log
      print('$runtimeType - safely emitted state after after calling close');
    } else {
      super.emit(state);
    }
  }
}
