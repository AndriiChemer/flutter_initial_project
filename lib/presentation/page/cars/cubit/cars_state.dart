part of 'cars_cubit.dart';

sealed class CarsState {}

class LoadingCars extends CarsState {}

class ShowCars extends CarsState {
  ShowCars(this.cars);

  final List<Car> cars;
}
