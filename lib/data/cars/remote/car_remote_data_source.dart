import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iteo_libraries_example/data/cars/dto/car_dto.gen.dart';

const _baseUrl = 'https://iteorecruitment-591c.restdb.io/rest';
final _headers = {'x-apikey': '795ad45e4dc222bc0e5bd1c163bb885e3635e'};

abstract class CarRemoteDataSource {
  Future<List<CarDTO>> getCarList();
}

class CarRemoteDataSourceImpl implements CarRemoteDataSource {
  CarRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<List<CarDTO>> getCarList() async {
    final url = Uri.parse('$_baseUrl/car-list');
    final response = await client.get(url, headers: _headers);

    final jsonList = json.decode(response.body) as List<dynamic>;
    return jsonList.map((dynamic item) => CarDTO.fromJson(item as Map<String, dynamic>)).toList();
  }
}
