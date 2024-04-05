import 'dart:convert';

import 'package:chopper/chopper.dart';

typedef FactoryMethod<T> = T Function(Map<String, dynamic> json);

class ResultApiResolver {
  static Response<T> resolve<T>(
    Response response,
    FactoryMethod<T> factoryMethod,
  ) {
    final data = jsonDecode(response.body as String) as Map<String, dynamic>;
    return response.copyWith(
      body: factoryMethod(data),
    );
  }

  static Response<List<T>> resolveList<T>(
      Response response,
      FactoryMethod<T> factoryMethod,
  ) {
    final dataList = jsonDecode(response.body as String) as List<dynamic>;

    final convertedList = dataList
        .map((item) => factoryMethod(item as Map<String, dynamic>))
        .toList();

    return response.copyWith(
      body: convertedList,
    );
  }
}
