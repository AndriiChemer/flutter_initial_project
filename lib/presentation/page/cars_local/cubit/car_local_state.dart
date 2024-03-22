part of 'car_local_cubit.dart';

sealed class CarLocalState extends Equatable {}

class CarsLocalInitial extends CarLocalState {
  @override
  List<Object> get props => [];
}

class EmptyCars extends CarLocalState {
  @override
  List<Object?> get props => [];
}

class ShowLocalCars extends CarLocalState {
  ShowLocalCars(this.cars);

  final List<Car> cars;

  @override
  List<Object?> get props => [cars];
}
