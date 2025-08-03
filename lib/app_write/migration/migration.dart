import 'package:appwrite/appwrite.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/appwrite_converter.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/daily_content_dto.dart';

Future<void> migrate() async {
  final dbProd = getDataBaseProd();
  final dbDev = getDataBaseDev();

  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'categories',
  //   convert: CategoryDTO.fromAppWriteJson,
  // );

  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'subcategory',
  //   convert: SubcategoryDTO.fromAppWriteJson,
  // );

  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'challenges',
  //   convert: ChallengeDTO.fromAppWriteJson,
  // );

  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'challenge_steps',
  //   convert: ChallengeStepDTO.fromAppWriteJson,
  // );
  //
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'daily_tasks',
  //   convert: DailyTaskDTO.fromAppWriteJson,
  // );
  //
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'daily_phrases',
  //   convert: DailyPhraseDTO.fromAppWriteJson,
  // );
  //
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'tests',
  //   convert: TestDTO.fromAppWriteJson,
  // );
  //
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'test_questions',
  //   convert: TestQuestionDTO.fromAppWriteJson,
  // );
  //
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'techniques',
  //   convert: TechniqueDTO.fromAppWriteJson,
  // );
  //
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'technique_steps',
  //   convert: TechniqueStepDTO.fromAppWriteJson,
  // );
  // await migrateCollection(
  //   databaseDataFrom: dbProd,
  //   databaseDataTo: dbDev,
  //   dateFromDatabaseId: prodDatabaseId,
  //   dateToDatabaseId: devDatabaseId,
  //   collectionId: 'course',
  //   convert: CourseDTO.fromAppWriteJson,
  // );
  //
  await migrateCollection(
    databaseDataFrom: dbProd,
    databaseDataTo: dbDev,
    dateFromDatabaseId: prodDatabaseId,
    dateToDatabaseId: devDatabaseId,
    collectionId: 'daily_content',
    convert: DailyContentDTO.fromAppWriteJson,
  );
}

Future<void> migrateCollection({
  required Databases databaseDataFrom,
  required Databases databaseDataTo,
  required String dateFromDatabaseId,
  required String dateToDatabaseId,
  required String collectionId,
  required AppwriteConverter Function(Map<String, dynamic> json) convert,
}) async {
  // var pageSize = 60;
  // var page = 0; //2

  final docs = await databaseDataFrom.listDocuments(
    databaseId: dateFromDatabaseId,
    collectionId: collectionId,
    queries: [
      Query.limit(100),
      // Query.limit(pageSize),
      // Query.offset(page * pageSize),
    ],
  );

  final items = <String>[];

  for (final doc in docs.documents) {
    items.add(doc.$id);
    print('ANDRII doc: ${doc.$id}');

    final data = convert(doc.data);
    try {
      await databaseDataTo.createDocument(
        databaseId: dateToDatabaseId,
        collectionId: collectionId,
        documentId: doc.$id,
        data: data.toDataBaseJson(),
      );
    } catch (ex) {
      print('Failed to create document for collectionId $collectionId. - Size: ${items.length}');
      rethrow;
    }
  }

  print('✅ Finish for collection $collectionId. - Size: ${items.length}');
}
