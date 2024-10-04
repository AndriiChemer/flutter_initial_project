import 'package:equatable/equatable.dart';
import 'package:iteo_libraries_example/core/logger/logger.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/manage_local_cars_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'cars_state.dart';

part 'cars_action.dart';

class CarsCubit extends SafeActionCubit<CarsState, CarsAction> {
  CarsCubit({
    required this.getCarsUseCase,
    required this.manageLocalCarsUseCase,
    required this.getCarsFromIsolateExecutorUseCase,
    required this.loadCarsFromIsolateExecutorUseCase,
  }) : super(LoadingCars());

  final GetCarsUseCase getCarsUseCase;
  final ManageLocalCarsUseCase manageLocalCarsUseCase;
  final GetCarsFromIsolateExecutorUseCase getCarsFromIsolateExecutorUseCase;
  final LoadCarsFromIsolateExecutorUseCase loadCarsFromIsolateExecutorUseCase;

  Future<void> getCars() async {
    try {
      final cars = await getCarsUseCase();
      emit(ShowCars(List.from(cars)));
    } catch (ex) {
      Logger.e('getCars failed.', ex: ex);
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  Future<void> getCarsFromIsolateExecutor() async {
    emit(LoadingCars());
    try {
      final cars = await getCarsFromIsolateExecutorUseCase();
      emit(ShowCars(List.from(cars)));
    } catch (ex) {
      Logger.e('getCarsFromIsolateExecutor failed.', ex: ex);
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  void loadCardsFromIsolateExecutor() {
    emit(LoadingCars());
    try {
      loadCarsFromIsolateExecutorUseCase(
        onSuccess: (cars) {
          emit(ShowCars(List.from(cars)));
        },
        onError: (error, stacktrace) {
          Logger.e('loadCardsFromIsolateExecutor failed.', ex: error);
          emit(ShowCars(List.empty()));
          dispatch(ShowError());
        },
      );
    } catch (ex) {
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  Future<void> saveToDatabase(List<Car> cars) async {
    try {
      await manageLocalCarsUseCase.save(cars);
      dispatch(SavedToDatabase());
    } catch (ex) {
      dispatch(ShowError());
    }
  }
}
