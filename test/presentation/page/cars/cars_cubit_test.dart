import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/manage_local_cars_use_case.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_helpers/test_action_bloc.dart';
import 'cars_cubit_test.mocks.dart';

@GenerateMocks(
  [
    GetCarsUseCase,
    ManageLocalCarsUseCase,
    GetCarsFromIsolateExecutorUseCase,
    LoadCarsFromIsolateExecutorUseCase,
  ],
)
void main() {
  late CarsCubit cubit;

  late GetCarsUseCase getCarsUseCase;
  late ManageLocalCarsUseCase manageLocalCarsUseCase;
  late GetCarsFromIsolateExecutorUseCase getCarsFromIsolateExecutorUseCase;
  late LoadCarsFromIsolateExecutorUseCase loadCarsFromIsolateExecutorUseCase;

  final cars = [
    Car(id: 'id', brand: 'brand', model: 'model', registration: 'registration'),
  ];

  setUp(() {
    getCarsUseCase = MockGetCarsUseCase();
    manageLocalCarsUseCase = MockManageLocalCarsUseCase();
    getCarsFromIsolateExecutorUseCase = MockGetCarsFromIsolateExecutorUseCase();
    loadCarsFromIsolateExecutorUseCase = MockLoadCarsFromIsolateExecutorUseCase();

    cubit = CarsCubit(
      getCarsUseCase: getCarsUseCase,
      getCarsFromIsolateExecutorUseCase: getCarsFromIsolateExecutorUseCase,
      loadCarsFromIsolateExecutorUseCase: loadCarsFromIsolateExecutorUseCase,
      manageLocalCarsUseCase: manageLocalCarsUseCase,
    );
  });

  group('getCars', () {

    actionBlocTest<CarsCubit, CarsState, CarsAction>(
      'success',
      build: () => cubit,
      setUp: () {
        when(getCarsUseCase.call())
            .thenAnswer((_) => Future.value(cars));
      },
      act: (cubit) => cubit.getCars(),
      expect: () => <CarsState>[ ShowCars(cars) ],
      expectActions: () => <CarsAction>[],
      verify: (_) => verify(getCarsUseCase()).called(1),
    );


    actionBlocTest<CarsCubit, CarsState, CarsAction>(
      'should emit empty car list and error',
      build: () => cubit,
      setUp: () {
        when(getCarsUseCase.call())
            .thenAnswer((_) => Future.error(Exception()));
      },
      act: (cubit) => cubit.getCars(),
      expect: () => <CarsState>[ ShowCars(List.empty()) ],
      expectActions: () => <CarsAction>[ ShowError() ],
      verify: (_) => verify(getCarsUseCase()).called(1),
    );
  });
}
