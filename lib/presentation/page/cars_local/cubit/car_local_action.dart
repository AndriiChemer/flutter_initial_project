part of 'car_local_cubit.dart';

sealed class CarLocalAction with EquatableMixin {}

class ShowError extends CarLocalAction {
  @override
  List<Object?> get props => [];
}
