import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';

Future<void> readTechniques() async {
  final database = getDataBaseProd();

  const collection = 'techniques';

  final dataList = await _getData(
    database: database,
    collectionId: collection,
    categoryId: categoryId,
  );

  showLogDays(dataList);
}

Future<List<TechniqueDTO>> _getData({
  required Databases database,
  required String collectionId,
  required String categoryId,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: prodDatabaseId,
      queries: [Query.equal('category_id', categoryId)],
    );

    return response.documents.map((document) => TechniqueDTO.fromAppWriteJson(document.data)).toList();
  } catch (e) {
    print('ANDRII: _getData error: $e');
    rethrow;
  }
}

void showLogDays(List<TechniqueDTO> dataList) {
  log('\n\n');
  for (final dailyContent in dataList) {
    log('ID: ${dailyContent.id}');
    log('Title: ${dailyContent.title.en}');
    log('\n\n');
  }
}
