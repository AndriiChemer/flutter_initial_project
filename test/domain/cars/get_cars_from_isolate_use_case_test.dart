import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_use_case.dart';
import 'package:mockito/mockito.dart';

import 'get_cars_use_case_test.mocks.dart';

void main() {
  late MockCarRepository mockCarRepository;
  late GetCarsFromIsolateUseCase getCarsFromIsolateUseCase;

  setUp(() {
    mockCarRepository = MockCarRepository();
    getCarsFromIsolateUseCase = GetCarsFromIsolateUseCase(mockCarRepository);
  });

  test('should return a list of cars from the repository executed in isolate', () async {
    final cars = [
      Car(id: 'id', brand: 'brand', model: 'model', registration: 'XXXXX'),
    ];

    when(mockCarRepository.getCarsFromIsolate()).thenAnswer((_) async => cars);
    final result = await getCarsFromIsolateUseCase.call();

    expect(result, isA<List<Car>>());
    expect(result, cars);
    verify(mockCarRepository.getCarsFromIsolate()).called(1);
  });

  test('throw exception when get list of cars failed', () async {
    when(mockCarRepository.getCarsFromIsolate()).thenThrow(Exception());

    expect(() => getCarsFromIsolateUseCase(), throwsException);
    verify(mockCarRepository.getCarsFromIsolate()).called(1);
  });
}
