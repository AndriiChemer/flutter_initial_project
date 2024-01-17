import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'cars_state.dart';
part 'cars_action.dart';

class CarsCubit extends SafeActionCubit<CarsState, CarsAction> {
  CarsCubit({
    required this.getCarsUseCase,
  }) : super(CarsInitial());

  final GetCarsUseCase getCarsUseCase;

  Future<void> refreshCars() async {
  }
}
