import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart' show rootBundle;

const databaseId = '68225f7d0027204d0c21';

// const courseId = 'towards_each_other';
// const courseSlug = 'towards_each_other';
// const categoryId = 'relationship_crisis';

const courseId = 'sexual-closeness';
const courseSlug = 'sexual-closeness';
const categoryId = 'sexual_closeness';

///========================

/// API Endpoint: https://fra.cloud.appwrite.io/v1
/// ProjectId: 68225f5e002dfa8abbab
Databases getDataBase() {
  final client = Client()
    ..setEndpoint('https://fra.cloud.appwrite.io/v1')
    ..setProject('68225f5e002dfa8abbab')
    ..setSelfSigned(status: true);

  return Databases(client);
}

Future<List<dynamic>> getFileDataList(String path) async {
  final String jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString) as List<dynamic>;
}

Future<Map<String, dynamic>> getFileDataMap(String path) async {
  final String jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString) as Map<String, dynamic>;
}
