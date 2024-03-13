// Mocks generated by Mockito 5.4.4 from annotations
// in iteo_libraries_example/test/presentation/page/cars/cars_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:iteo_libraries_example/domain/cars/model/car.dart' as _i4;
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart'
    as _i7;
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_use_case.dart'
    as _i5;
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart'
    as _i2;
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart'
    as _i8;
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_use_case.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetCarsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCarsUseCase extends _i1.Mock implements _i2.GetCarsUseCase {
  MockGetCarsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Car>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Car>>.value(<_i4.Car>[]),
      ) as _i3.Future<List<_i4.Car>>);
}

/// A class which mocks [GetCarsFromIsolateUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCarsFromIsolateUseCase extends _i1.Mock
    implements _i5.GetCarsFromIsolateUseCase {
  MockGetCarsFromIsolateUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Car>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Car>>.value(<_i4.Car>[]),
      ) as _i3.Future<List<_i4.Car>>);
}

/// A class which mocks [LoadCarsFromIsolateUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadCarsFromIsolateUseCase extends _i1.Mock
    implements _i6.LoadCarsFromIsolateUseCase {
  MockLoadCarsFromIsolateUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void call({
    required void Function(List<_i4.Car>)? onSuccess,
    required void Function(
      String,
      String,
    )? onError,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #onSuccess: onSuccess,
            #onError: onError,
          },
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GetCarsFromIsolateExecutorUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCarsFromIsolateExecutorUseCase extends _i1.Mock
    implements _i7.GetCarsFromIsolateExecutorUseCase {
  MockGetCarsFromIsolateExecutorUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Car>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Car>>.value(<_i4.Car>[]),
      ) as _i3.Future<List<_i4.Car>>);
}

/// A class which mocks [LoadCarsFromIsolateExecutorUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadCarsFromIsolateExecutorUseCase extends _i1.Mock
    implements _i8.LoadCarsFromIsolateExecutorUseCase {
  MockLoadCarsFromIsolateExecutorUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void call({
    required void Function(List<_i4.Car>)? onSuccess,
    required void Function(
      String,
      String,
    )? onError,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #onSuccess: onSuccess,
            #onError: onError,
          },
        ),
        returnValueForMissingStub: null,
      );
}
