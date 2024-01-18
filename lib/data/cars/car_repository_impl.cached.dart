// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'car_repository_impl.dart';

// **************************************************************************
// CachedGenerator
// **************************************************************************

abstract class _$CarRepositoryImpl {
  CarRemoteDataSource get carRemoteDataSource;
  CarDTOToCarMapper get carDTOToCarMapper;
}

class _CarRepositoryImpl with CarRepositoryImpl implements _$CarRepositoryImpl {
  _CarRepositoryImpl(
      {required this.carRemoteDataSource, required this.carDTOToCarMapper});

  @override
  final CarRemoteDataSource carRemoteDataSource;
  @override
  final CarDTOToCarMapper carDTOToCarMapper;

  final _getCarsSync = <String, Future<List<Car>>>{};

  final _getCarsCached = <String, List<Car>>{};

  @override
  Future<List<Car>> getCars() async {
    final cachedValue = _getCarsCached[""];
    if (cachedValue == null) {
      final cachedFuture = _getCarsSync[""];

      if (cachedFuture != null) {
        return cachedFuture;
      }

      final List<Car> toReturn;
      try {
        final result = super.getCars();
        _getCarsSync[""] = result;
        toReturn = await result;
      } catch (_) {
        rethrow;
      } finally {
        _getCarsSync.remove('');
      }

      _getCarsCached[""] = toReturn;

      return toReturn;
    } else {
      return cachedValue;
    }
  }
}
