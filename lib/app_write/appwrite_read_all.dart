import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_phrase/daily_phrase_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_dto.dart';

Future<void> readAll() async {
  final database = getDataBase();

  const testsCollection = 'tests';
  const challengeCollection = 'challenges';
  const dailyPhraseCollection = 'daily_phrases';
  const dailyTaskCollection = 'daily_tasks';
  const techniquesCollection = 'techniques';

  final testList = await _readTestByCategory(
    database: database,
    collectionId: testsCollection,
    categoryId: categoryId,
  );

  final challengeList = await _readChallengesByCategory(
    database: database,
    collectionId: challengeCollection,
    categoryId: categoryId,
  );

  final dailyPhrasesList = await _readPhraseByCategory(
    database: database,
    collectionId: dailyPhraseCollection,
    categoryId: categoryId,
  );

  final dailyTasksList = await _readDailyTasksByCategory(
    database: database,
    collectionId: dailyTaskCollection,
    categoryId: categoryId,
  );

  final techniquesList = await _readTechniquesByCategory(
    database: database,
    collectionId: techniquesCollection,
    categoryId: categoryId,
  );

  final testTitles = testList.map((item) => item.title.languages['en']).toList();
  final challengeTitles = challengeList.map((item) => item.title.languages['en']).toList();
  final dailyPhrasesTitles = dailyPhrasesList.map((item) => item.phrase.languages['en']).toList();
  final dailyTasksTitles = dailyTasksList.map((item) => item.title.languages['en']).toList();
  final techniquesTitles = techniquesList.map((item) => item.title.languages['en']).toList();

  log('ANDRII: testTitles====\n$testTitles\n\n====');
  log('ANDRII: challengeTitles====\n$challengeTitles\n\n====');
  log('ANDRII: dailyPhrasesTitles====\n$dailyPhrasesTitles\n\n====');
  log('ANDRII: dailyTasksTitles====\n$dailyTasksTitles\n\n====');
  log('ANDRII: techniquesTitles====\n$techniquesTitles\n\n====');
}

/// generate id: ID.unique()
Future<List<TestDTO>> _readTestByCategory({
  required Databases database,
  required String collectionId,
  required String categoryId,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('category_id', categoryId)],
    );

    final document = response.documents;

    if (document.isNotEmpty) {
      final dataList = document.map((document) => TestDTO.fromAppWriteJson(document.data)).toList();
      print('✅ Tests size: "${dataList.length}".');
      return dataList;
    } else {
      print('Tests empty.');
      return [];
    }
  } catch (e) {
    print('ANDRII: tests error $e');
  }
  return [];
}

Future<List<ChallengeDTO>> _readChallengesByCategory({
  required Databases database,
  required String collectionId,
  required String categoryId,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('category_id', categoryId)],
    );

    final document = response.documents;

    if (document.isNotEmpty) {
      final dataList = document.map((document) => ChallengeDTO.fromAppWriteJson(document.data)).toList();
      print('✅ Challenges size: "${dataList.length}".');
      return dataList;
    } else {
      print('Challenges empty.');
      return [];
    }
  } catch (e) {
    print('ANDRII: Challenges error $e');
  }
  return [];
}

Future<List<DailyPhraseDTO>> _readPhraseByCategory({
  required Databases database,
  required String collectionId,
  required String categoryId,
}) async {
  const pageSize = 100;
  int offset = 0;
  int total = 0;
  final List<DailyPhraseDTO> allPhrases = [];

  try {
    do {
      final response = await database.listDocuments(
        collectionId: collectionId,
        databaseId: databaseId,
        queries: [
          Query.equal('category_id', categoryId),
          Query.limit(pageSize),
          Query.offset(offset),
        ],
      );

      final docs = response.documents;
      allPhrases.addAll(docs.map((doc) => DailyPhraseDTO.fromAppWriteJson(doc.data)));

      total = response.total;
      offset += docs.length;
    } while (offset < total);

    print('✅ Phrases size: "${allPhrases.length}".');
    return allPhrases;
  } catch (e) {
    print('ANDRII: Phrases error $e');
    rethrow;
    return [];
  }
}

// Future<List<DailyPhraseDTO>> _readPhraseByCategory({
//   required Databases database,
//   required String collectionId,
//   required String categoryId,
// }) async {
//   try {
//     final response = await database.listDocuments(
//       collectionId: collectionId,
//       databaseId: databaseId,
//       // queries: [Query.equal('category_id', categoryId)],
//       queries: [Query.equal('category_id', "sexual_closeness")],
//     );
//     print('ANDRII total: ${response.total}');
//
//     final document = response.documents;
//
//     if (document.isNotEmpty) {
//       final dataList = document.map((document) => DailyPhraseDTO.fromAppWriteJson(document.data)).toList();
//       print('✅ Phrases size: "${dataList.length}".');
//       return dataList;
//     } else {
//       print('Phrases empty.');
//       return [];
//     }
//   } catch (e) {
//     print('ANDRII: Phrases error $e');
//   }
//   return [];
// }

Future<List<DailyTaskDTO>> _readDailyTasksByCategory({
  required Databases database,
  required String collectionId,
  required String categoryId,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('category_id', categoryId)],
    );

    final document = response.documents;

    if (document.isNotEmpty) {
      final dataList = document.map((document) => DailyTaskDTO.fromAppWriteJson(document.data)).toList();
      print('✅ Tasks size: "${dataList.length}".');
      return dataList;
    } else {
      print('Tasks empty.');
      return [];
    }
  } catch (e) {
    rethrow;
    print('ANDRII: Tasks error $e');
  }
  return [];
}

Future<List<TechniqueDTO>> _readTechniquesByCategory({
  required Databases database,
  required String collectionId,
  required String categoryId,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('category_id', categoryId)],
    );

    final document = response.documents;

    if (document.isNotEmpty) {
      final dataList = document.map((document) => TechniqueDTO.fromAppWriteJson(document.data)).toList();
      print('✅ Techniques size: "${dataList.length}".');
      return dataList;
    } else {
      print('Techniques empty.');
      return [];
    }
  } catch (e) {
    print('ANDRII: Techniques error $e');
  }
  return [];
}
