// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_remote_data_source.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CarRemoteDataSourceImpl extends CarRemoteDataSourceImpl {
  _$CarRemoteDataSourceImpl([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CarRemoteDataSourceImpl;

  @override
  Future<Response<List<CarDTO>>> getCarList() {
    final Uri $url = Uri.parse('car-list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CarDTO>, CarDTO>($request);
  }
}
