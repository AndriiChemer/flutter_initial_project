import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'package:iteo_libraries_example/data/cars/dto/car_dto.gen.dart';

const _baseUrl = 'https://iteorecruitment-591c.restdb.io/rest';
final _headers = {'x-apikey': '795ad45e4dc222bc0e5bd1c163bb885e3635e'};

abstract class CarRemoteDataSource {
  Future<List<CarDTO>> getCarList();
  Future<List<CarDTO>> getCarsIsolate({
    void Function(List<CarDTO> cars)? onSuccess,
    void Function(String error, String stacktrace)? onError,
  });
}

class CarRemoteDataSourceImpl implements CarRemoteDataSource {
  CarRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<List<CarDTO>> getCarList() async {
    final url = Uri.parse('$_baseUrl/car-list');
    print('====================HTTPS REQUEST=======================');
    final response = await client.get(url, headers: _headers);

    final jsonList = json.decode(response.body) as List<dynamic>;
    return jsonList.map(CarDTO.fromDynamic).toList();
  }

  @override
  Future<List<CarDTO>> getCarsIsolate({
    void Function(List<CarDTO> cars)? onSuccess,
    void Function(String error, String stacktrace)? onError,
  }) async {
    final completer = Completer<List<CarDTO>>();
    final port = ReceivePort();
    final errorPort = ReceivePort();
    await Isolate.spawn(
      (sendPort) async {
        final responseBody = await getCarListStatic();
        Isolate.exit(sendPort, responseBody);
      },
      port.sendPort,
      onError: errorPort.sendPort,
    );

    errorPort.listen((message) {
      final errors = message as List;
      final error = errors.first as String;
      final stacktrace = errors[1] as String;

      errorPort.close();
      onError?.call(error, stacktrace);
      completer.completeError(error);
    });

    port.listen((message) {
      final listDynamic = json.decode(message as String) as List<dynamic>;
      final carList = listDynamic
        .map(CarDTO.fromDynamic)
        .toList();

      port.close();
      onSuccess?.call(carList);
      completer.complete(carList);
    });

    return completer.future;
  }
}

Future<String> getCarListStatic() async {
  final url = Uri.parse('$_baseUrl/car-list');
  final response = await http.Client().get(url, headers: _headers);
  return response.body;
}
