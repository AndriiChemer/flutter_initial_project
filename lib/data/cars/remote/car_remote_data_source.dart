import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/data/cars/dto/car_dto.gen.dart';
import 'package:iteo_libraries_example/data/network/authorized_api_client.dart';

part 'car_remote_data_source.chopper.dart';

abstract class CarRemoteDataSource {
  Future<Response<List<CarDTO>>> getCarList();
}

@ChopperApi()
abstract class CarRemoteDataSourceImpl extends ChopperService implements CarRemoteDataSource {
  @factoryMethod
  static CarRemoteDataSourceImpl create(AuthorizedApiClient client) {
    return _$CarRemoteDataSourceImpl(client);
  }

  @Get(path: 'car-list')
  @override
  Future<Response<List<CarDTO>>> getCarList();
}

Future<String> getCarListStatic() async {
  const baseUrl = 'https://iteorecruitment-591c.restdb.io/rest';
  const headers = {'x-apikey': '795ad45e4dc222bc0e5bd1c163bb885e3635e'};

  final url = Uri.parse('$baseUrl/car-list');
  final response = await http.Client().get(url, headers: headers);
  return response.body;
}
