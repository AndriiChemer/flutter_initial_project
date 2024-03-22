import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/save_cars_to_database_use_case.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_helpers/test_action_bloc.dart';
import 'cars_cubit_test.mocks.dart';

@GenerateMocks(
  [
    GetCarsUseCase,
    SaveCarsToDatabaseUseCase,
    GetCarsFromIsolateUseCase,
    LoadCarsFromIsolateUseCase,
    GetCarsFromIsolateExecutorUseCase,
    LoadCarsFromIsolateExecutorUseCase,
  ],
)
void main() {
  late CarsCubit cubit;

  late GetCarsUseCase getCarsUseCase;
  late SaveCarsToDatabaseUseCase saveCarsToDatabaseUseCase;
  late GetCarsFromIsolateUseCase getCarsFromIsolateUseCase;
  late LoadCarsFromIsolateUseCase loadCarsFromIsolateUseCase;
  late GetCarsFromIsolateExecutorUseCase getCarsFromIsolateExecutorUseCase;
  late LoadCarsFromIsolateExecutorUseCase loadCarsFromIsolateExecutorUseCase;

  final cars = [
    Car(id: 'id', brand: 'brand', model: 'model', registration: 'registration'),
  ];

  setUp(() {
    getCarsUseCase = MockGetCarsUseCase();
    saveCarsToDatabaseUseCase = MockSaveCarsToDatabaseUseCase();
    getCarsFromIsolateUseCase = MockGetCarsFromIsolateUseCase();
    loadCarsFromIsolateUseCase = MockLoadCarsFromIsolateUseCase();
    getCarsFromIsolateExecutorUseCase = MockGetCarsFromIsolateExecutorUseCase();
    loadCarsFromIsolateExecutorUseCase = MockLoadCarsFromIsolateExecutorUseCase();



    cubit = CarsCubit(
      getCarsUseCase: getCarsUseCase,
      getCarsFromIsolateUseCase: getCarsFromIsolateUseCase,
      loadCarsFromIsolateUseCase: loadCarsFromIsolateUseCase,
      getCarsFromIsolateExecutorUseCase: getCarsFromIsolateExecutorUseCase,
      loadCarsFromIsolateExecutorUseCase: loadCarsFromIsolateExecutorUseCase,
      saveCarsToDatabaseUseCase: saveCarsToDatabaseUseCase,
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

  group('getCarsFromIsolate', () {

    actionBlocTest<CarsCubit, CarsState, CarsAction>(
      'success',
      build: () => cubit,
      setUp: () {
        when(getCarsFromIsolateUseCase.call())
            .thenAnswer((_) => Future.value(cars));
      },
      act: (cubit) => cubit.getCarsFromIsolate(),
      expect: () => <CarsState>[ LoadingCars(), ShowCars(cars) ],
      expectActions: () => <CarsAction>[],
      verify: (_) => verify(getCarsFromIsolateUseCase()).called(1),
    );


    actionBlocTest<CarsCubit, CarsState, CarsAction>(
      'should emit empty car list and error',
      build: () => cubit,
      setUp: () {
        when(getCarsFromIsolateUseCase.call())
            .thenAnswer((_) => Future.error(Exception()));
      },
      act: (cubit) => cubit.getCarsFromIsolate(),
      expect: () => <CarsState>[ LoadingCars(), ShowCars(List.empty()) ],
      expectActions: () => <CarsAction>[ ShowError() ],
      verify: (_) => verify(getCarsFromIsolateUseCase()).called(1),
    );
  });
}
