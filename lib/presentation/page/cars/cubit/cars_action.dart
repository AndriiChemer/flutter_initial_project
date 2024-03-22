part of 'cars_cubit.dart';

sealed class CarsAction with EquatableMixin {}

class SavedToDatabase extends CarsAction {
  @override
  List<Object?> get props => [];
}

class ShowError extends CarsAction {
  @override
  List<Object?> get props => [];
}
