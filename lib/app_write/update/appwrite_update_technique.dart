import 'package:iteo_libraries_example/app_write/database_config.dart';

Future<void> updateToDatabaseSingleTechnique() async {
  final database = getDataBaseProd();

  const documentId = 'day-3';
  const techniqueId = 'shared-list-of-pain-and-joy';
  try {
    await database.updateDocument(
      databaseId: prodDatabaseId,
      collectionId: 'daily_content',
      documentId: documentId,
      data: {
        'technique_id': [techniqueId]
      },
    );
    print('✅ Technique "$techniqueId" updated.');
  } catch (e) {
    print('ANDRII: updateToDatabaseTechnique error $e');
    rethrow;
  }
}
