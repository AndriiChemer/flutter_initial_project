part of 'cars_cubit.dart';

sealed class CarsAction with EquatableMixin {}

class ShowError extends CarsAction {
  @override
  List<Object?> get props => [];
}
