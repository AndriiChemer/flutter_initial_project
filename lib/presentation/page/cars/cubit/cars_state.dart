part of 'cars_cubit.dart';

sealed class CarsState extends Equatable {}

class LoadingCars extends CarsState {
  @override
  List<Object?> get props => [];
}

class ShowCars extends CarsState {
  ShowCars(this.cars);

  final List<Car> cars;

  @override
  List<Object?> get props => [cars];
}
