import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cubit/car_local_cubit.dart';

import '../../../test/test_helpers/test_action_bloc.dart';

class MockCarsCubit extends MockCubit<CarsState> implements CarsCubit {
  @override
  Future<void> getCars() => Future.value();
}

class MockCarLocalCubit extends MockCubit<CarLocalState> implements CarLocalCubit {
  @override
  Future<void> loadCars() => Future.value();

  @override
  Future<void> clearCarsDatabase() {
    return Future.value();
  }
}

class CarsLocalPageMock {
  CarsLocalPageMock() {
    carsCubit = MockCarsCubit();
    carLocalCubit = MockCarLocalCubit();
  }

  late MockCarsCubit carsCubit;
  late MockCarLocalCubit carLocalCubit;

  Future<GetIt> registerAndReturnGetIt() async {
    final getIt = GetIt.instance;
    await getIt.reset();

    getIt.registerFactory<CarsCubit>(() => carsCubit);
    getIt.registerFactory<CarLocalCubit>(() => carLocalCubit);

    return getIt;
  }

  final cars = <Car>[
    Car(
      id: '1',
      brand: 'brand1',
      model: 'model1',
      registration: 'registration1',
    ),
    Car(
      id: '2',
      brand: 'brand2',
      model: 'model2',
      registration: 'registration2',
    ),
  ];

  void mockRemoteCarsLoaded() {
    whenListen(
      carsCubit,
      Stream<CarsState>.fromIterable([
        LoadingCars(),
        ShowCars(cars),
      ]),
      initialState: LoadingCars(),
    );

    whenListenAction(
      carsCubit,
      Stream<CarsAction>.fromIterable([]),
    );
  }

  void mockEmptyLocalCars() {
    whenListen(
      carLocalCubit,
      Stream<CarLocalState>.fromIterable([
        CarsLocalInitial(),
        EmptyCars(),
      ]),
      initialState: CarsLocalInitial(),
    );

    whenListenAction(
      carLocalCubit,
      Stream<CarLocalAction>.fromIterable([]),
    );
  }

  void mockLocalCarsLoaded() {
    whenListen(
      carLocalCubit,
      Stream<CarLocalState>.fromIterable([
        CarsLocalInitial(),
        ShowLocalCars(List.from(cars)),
      ]),
      initialState: CarsLocalInitial(),
    );

    whenListenAction(
      carLocalCubit,
      Stream<CarLocalAction>.fromIterable([]),
    );
  }

  void mockCarsSavedToDatabase() {
    whenListen(
      carsCubit,
      Stream<CarLocalState>.fromIterable([]),
    );

    whenListenAction(
      carsCubit,
      Stream<CarsAction>.fromIterable([SavedToDatabase()]),
    );
  }
}
