// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:chopper/chopper.dart';

class CustomJsonConverter extends JsonConverter {
  const CustomJsonConverter(this.typeToJsonFactoryMap);

  final Map<Type, Function> typeToJsonFactoryMap;

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(
    Response<dynamic> response,
  ) {
    if (typeToJsonFactoryMap[InnerType] != null) {
      final body = fromJsonData<BodyType, InnerType>(
        response.body as String,
        typeToJsonFactoryMap[InnerType]!,
      );

      return response.copyWith(
        body: body,
      );
    }

    return response as Response<BodyType>;
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    final jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap.map((item) {
        return jsonParser(item as Map<String, dynamic>) as InnerType;
      }).toList() as T;
    }

    return jsonParser(jsonMap) as T;
  }
}
