import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_use_case.dart';
import 'package:mockito/mockito.dart';

import 'get_cars_use_case_test.mocks.dart';

void main() {
  late MockCarRepository mockCarRepository;
  late LoadCarsFromIsolateUseCase loadCarsFromIsolateUseCase;

  setUp(() {
    mockCarRepository = MockCarRepository();
    loadCarsFromIsolateUseCase = LoadCarsFromIsolateUseCase(mockCarRepository);
  });

  test('should emit a list of cars from the repository', () async {
    final cars = [
      Car(id: 'id', brand: 'brand', model: 'model', registration: 'XXXXX'),
    ];

    void onSuccessCallback(List<Car> result) {
      expect(result, isA<List<Car>>());
      expect(result, cars);
    }

    when(
      mockCarRepository.loadCarsFromIsolate(
        onSuccess: onSuccessCallback,
        onError: (_, __) {},
      ),
    ).thenReturn(onSuccessCallback.call(cars));

    loadCarsFromIsolateUseCase.call(
      onSuccess: onSuccessCallback,
      onError: (_, __) {  },
    );
  });

  test('emit exception when load list of cars in isolate', () async {
    const error = 'error';
    const stacktrace = 'stacktrace';

    void onFailedCallback(String errorResult, String stacktraceResult) {
      expect(errorResult, isA<String>());
      expect(errorResult, error);

      expect(stacktraceResult, isA<String>());
      expect(stacktraceResult, stacktrace);
    }

    when(
      mockCarRepository.loadCarsFromIsolate(
        onSuccess: (_) {},
        onError: onFailedCallback,
      ),
    ).thenReturn(onFailedCallback.call(error, stacktrace));

    loadCarsFromIsolateUseCase.call(
      onSuccess: (_) {},
      onError: onFailedCallback,
    );
  });
}
