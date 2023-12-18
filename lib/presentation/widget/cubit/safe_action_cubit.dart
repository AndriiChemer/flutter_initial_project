import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:meta/meta.dart';

abstract class SafeActionCubit<State extends Object, Action>
    extends ActionCubit<State, Action> {
  SafeActionCubit(super.initialState);

  @protected
  @visibleForTesting
  @override
  void emit(State state) {
    if (isClosed) {
      // TODO logget
      print('$runtimeType - safely emitted $state after after calling close');
    } else {
      super.emit(state);
    }
  }

  @protected
  @override
  void dispatch(Action action) {
    if (isClosed) {
      // TODO logget
      print('$runtimeType - safely dispatched $action after after calling close');
    } else {
      super.dispatch(action);
    }
  }
}
