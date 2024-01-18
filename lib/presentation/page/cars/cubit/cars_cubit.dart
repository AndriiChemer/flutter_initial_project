import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'cars_state.dart';
part 'cars_action.dart';

class CarsCubit extends SafeActionCubit<CarsState, CarsAction> {
  CarsCubit({
    required this.getCarsUseCase,
  }) : super(LoadingCars());

  final GetCarsUseCase getCarsUseCase;

  Future<void> getCars() async {
    try {
      final cars = await getCarsUseCase();
      emit(ShowCars(List.from(cars)));
    } catch(ex) {
      emit(ShowCars(List.empty()));
      dispatch(ShowError());
    }
  }
}
