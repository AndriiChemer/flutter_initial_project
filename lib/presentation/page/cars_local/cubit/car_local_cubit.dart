import 'package:equatable/equatable.dart';
import 'package:iteo_libraries_example/core/logger/logger.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/manage_local_cars_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'car_local_state.dart';
part 'car_local_action.dart';

class CarLocalCubit extends SafeActionCubit<CarLocalState, CarLocalAction> {
  CarLocalCubit({
    required this.manageLocalCarsUseCase,
  }) : super(CarsLocalInitial());

  final ManageLocalCarsUseCase manageLocalCarsUseCase;

  Future<void> loadCars() async {
    try {
      final cars = await manageLocalCarsUseCase.getCars();
      print('ANDRII loadCars: ${cars.length}');
      if (cars.isEmpty) {
        Logger.d('Car database is empty.');
        emit(EmptyCars());
      } else {
        emit(ShowLocalCars(List.from(cars)));
      }
    } catch (ex) {
      Logger.e('loadCars from database failed.', ex: ex);
      emit(EmptyCars());
      dispatch(ShowError());
    }
  }

  Future<void> clearCarsDatabase() async {
    try {
      print('ANDRII clearCarsDatabase');
      await manageLocalCarsUseCase.clearCars();
      await loadCars();
    } catch (ex) {
      dispatch(ShowError());
    }
  }
}
