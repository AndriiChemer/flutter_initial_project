import 'package:equatable/equatable.dart';
import 'package:iteo_libraries_example/core/logger/logger.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/save_cars_to_database_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'cars_state.dart';
part 'cars_action.dart';

class CarsCubit extends SafeActionCubit<CarsState, CarsAction> {
  CarsCubit({
    required this.getCarsUseCase,
    required this.saveCarsToDatabaseUseCase,
    required this.getCarsFromIsolateUseCase,
    required this.loadCarsFromIsolateUseCase,
    required this.getCarsFromIsolateExecutorUseCase,
    required this.loadCarsFromIsolateExecutorUseCase,
  }) : super(LoadingCars());

  final GetCarsUseCase getCarsUseCase;
  final SaveCarsToDatabaseUseCase saveCarsToDatabaseUseCase;
  final GetCarsFromIsolateUseCase getCarsFromIsolateUseCase;
  final LoadCarsFromIsolateUseCase loadCarsFromIsolateUseCase;
  final GetCarsFromIsolateExecutorUseCase getCarsFromIsolateExecutorUseCase;
  final LoadCarsFromIsolateExecutorUseCase loadCarsFromIsolateExecutorUseCase;

  Future<void> getCars() async {
    try {
      final cars = await getCarsUseCase();
      emit(ShowCars(List.from(cars)));
    } catch(ex) {
      Logger.e('getCars failed.', ex: ex);
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  Future<void> getCarsFromIsolate() async {
    emit(LoadingCars());
    try {
      final cars = await getCarsFromIsolateUseCase();
      emit(ShowCars(List.from(cars)));
    } catch(ex) {
      Logger.e('getCarsFromIsolate failed.', ex: ex);
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  Future<void> getCarsFromIsolateExecutor() async {
    emit(LoadingCars());
    try {
      final cars = await getCarsFromIsolateExecutorUseCase();
      emit(ShowCars(List.from(cars)));
    } catch(ex) {
      Logger.e('getCarsFromIsolateExecutor failed.', ex: ex);
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  void loadCardsFromIsolate() {
    emit(LoadingCars());
    try {
      loadCarsFromIsolateUseCase(
        onSuccess: (cars) {
          emit(ShowCars(List.from(cars)));
        },
        onError: (error, stacktrace) {
          Logger.e('loadCardsFromIsolate failed.', ex: error);
          emit(ShowCars(List.empty()));
          dispatch(ShowError());
        },
      );
    } catch(ex) {
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  void loadCardsFromIsolateExecutor() {
    emit(LoadingCars());
    try {
      loadCarsFromIsolateUseCase(
        onSuccess: (cars) {
          emit(ShowCars(List.from(cars)));
        },
        onError: (error, stacktrace) {
          Logger.e('loadCardsFromIsolateExecutor failed.', ex: error);
          emit(ShowCars(List.empty()));
          dispatch(ShowError());
        },
      );
    } catch(ex) {
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }

  Future<void> saveToDatabase(List<Car> cars) async {
    try {
      await saveCarsToDatabaseUseCase(cars);
      dispatch(SavedToDatabase());
    } catch(ex) {
      dispatch(ShowError());
    }
  }
}
