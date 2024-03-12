import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cars_use_case_test.mocks.dart';

@GenerateMocks(
  [
    CarRepository,
  ],
)
void main() {
  late MockCarRepository mockCarRepository;
  late GetCarsUseCase getCarsUseCase;

  setUp(() {
    mockCarRepository = MockCarRepository();
    getCarsUseCase = GetCarsUseCase(mockCarRepository);
  });

  test('should return a list of cars from the repository', () async {
    final cars = [
      Car(id: 'id', brand: 'brand', model: 'model', registration: 'XXXXX'),
    ];

    when(mockCarRepository.getCars()).thenAnswer((_) async => cars);
    final result = await getCarsUseCase.call();

    expect(result, isA<List<Car>>());
    expect(result, cars);
    verify(mockCarRepository.getCars()).called(1);
  });

  test('throw exception when get list of cars', () async {
    when(mockCarRepository.getCars()).thenThrow(Exception());

    expect(() => getCarsUseCase(), throwsException);
    verify(mockCarRepository.getCars()).called(1);
  });
}
