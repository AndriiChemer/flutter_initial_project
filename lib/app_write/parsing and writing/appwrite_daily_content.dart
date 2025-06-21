import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/json/daily_content_json_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_phrase/daily_phrase_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_dto.dart';

const databaseId = '68225f7d0027204d0c21';

// Update all
Future<List<dynamic>> _getFileData(String path) async {
  final String jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString) as List<dynamic>;
}

/// API Endpoint: https://fra.cloud.appwrite.io/v1
/// ProjectId: 68225f5e002dfa8abbab
Databases _getDataBase() {
  final client = Client()
    ..setEndpoint('https://fra.cloud.appwrite.io/v1')
    ..setProject('68225f5e002dfa8abbab')
    ..setSelfSigned(status: true);

  return Databases(client);
}

Future<void> writeToDataBaseDailyContents() async {
  final database = _getDataBase();

  const dailyContentCollection = 'daily_content';

  const courseId = 'towards_each_other';
  const courseSlug = 'towards_each_other';
  final listOfFilesDailyContents = [
    'assets/content/daily_content/category_relationship_crisis/1-24-days.json',
  ];

  // const courseId = 'sexual-closeness';
  // const courseSlug = 'sexual-closeness';
  // final listOfFilesDailyContents = [
  //   'assets/content/daily_content/category_sexual_closeness/1-25-days.json',
  // ];

  var dailyContentsJsons = <DailyContentJsonDTO>[];

  for (final filePath in listOfFilesDailyContents) {
    final contentList = await _getFileData(filePath);

    for (final dynamicData in contentList) {
      final dailyContentJson = DailyContentJsonDTO.fromJson(dynamicData as Map<String, dynamic>);
      dailyContentsJsons.add(
        dailyContentJson.copyWith(
          courseId: courseId,
          courseSlug: courseSlug,
        ),
      );
    }
  }

  // for (final item in dailyContentsJsons) {
  //   log('${item.courseId} - ${item.dayNumber}');
  // }

  final half = (dailyContentsJsons.length / 2).ceil();
  final firstPart = dailyContentsJsons.sublist(0, half);
  final secondPart = dailyContentsJsons.sublist(half);

  final all = [...firstPart, ...secondPart];
  for (final item in all) {
    log('${item.courseId} - ${item.dayNumber}');
  }

  // var createdDailyContents = <DailyContentDTO>[];
  // for (final dailyContent in dailyContents) {
  //   final createdCourse = await _createSingleDailyContent(
  //     database: database,
  //     collectionId: dailyContentCollection,
  //     dailyContent: dailyContent,
  //   );
  //   createdDailyContents.add(createdCourse);
  // }
  //
  // log('ANDRII \n\n=====START=============\n');
  // for (final createdDailyContent in createdDailyContents) {
  //   log('${createdDailyContent.id} - ${createdDailyContent.categoryId} - day: ${createdDailyContent.dayNumber}');
  // }
  // log('ANDRII \n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
// Future<DailyContentDTO> _createSingleDailyContent({
//   required Databases database,
//   required String collectionId,
//   required DailyContentJsonDTO dailyContentBeforeUpdate,
// }) async {
//   final dailyContentJson = dailyContentBeforeUpdate.copyWith(id: ID.unique());
//   try {
//     final testDTO = await _findTest(
//       database: database,
//       collectionId: 'tests',
//       title: dailyContentJson.testTitle,
//     );
//
//     final techniqueDTO = await _findTechnique(
//       database: database,
//       collectionId: 'techniques',
//       title: dailyContentJson.techniqueTitle,
//     );
//
//     final dailyTaskDTO = await _findDailyTask(
//       database: database,
//       collectionId: 'daily_tasks',
//       title: dailyContentJson.dailyTaskTitle,
//     );
//
//     final challengeDTO = await _findChallenge(
//       database: database,
//       collectionId: 'challenges',
//       title: dailyContentJson.challengeTitle,
//     );
//
//     final phraseDTO = await _findPhrase(
//       database: database,
//       collectionId: 'daily_phrases',
//       title: dailyContentJson.phraseTitle,
//     );
//
//     //TODO create DailyContent with ids:
//
//
//     // await database.createDocument(
//     //   databaseId: databaseId,
//     //   collectionId: collectionId,
//     //   documentId: dailyContent.id,
//     //   data: dailyContent.toDataBaseJson(),
//     // );
//     print('✅ DailyContent created.');
//     return dailyContent;
//   } catch (e) {
//     print('ANDRII: _createSingleCourse ${dailyContent.id} | ${dailyContent.dayNumber} error $e');
//     rethrow;
//   }
// }

Future<TestDTO?> _findTest({
  required Databases database,
  required String collectionId,
  required String? title,
}) async {
  if (title == null) {
    return null;
  }
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final test = TestDTO.fromAppWriteJson(document.data);
      print('✅ existing Test - ${test.id}');
      return test;
    } else {
      throw Exception('Can not find Test by title: $title');
    }
  } catch (e) {
    print('ANDRII: _findTest: $title error $e');
    rethrow;
  }
}

Future<TechniqueDTO?> _findTechnique({
  required Databases database,
  required String collectionId,
  required String? title,
}) async {
  if (title == null) {
    return null;
  }

  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final techniqueDTO = TechniqueDTO.fromAppWriteJson(document.data);
      print('✅ Technique - ${techniqueDTO.id}');
      return techniqueDTO;
    } else {
      throw Exception('Can not find Technique by title: $title');
    }
  } catch (e) {
    print('ANDRII: _findTechnique: $title error $e');
    rethrow;
  }
}

Future<DailyTaskDTO?> _findDailyTask({
  required Databases database,
  required String collectionId,
  required String? title,
}) async {
  if (title == null) {
    return null;
  }

  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final dailyTaskDTO = DailyTaskDTO.fromAppWriteJson(document.data);
      print('✅ DailyTask existing phrase - ${dailyTaskDTO.id}');
      return dailyTaskDTO;
    } else {
      throw Exception('Can not find DailyTask by title: $title');
    }
  } catch (e) {
    print('ANDRII: _findDailyTask: $title error $e');
    rethrow;
  }
}

Future<ChallengeDTO?> _findChallenge({
  required Databases database,
  required String collectionId,
  required String? title,
}) async {
  if (title == null) {
    return null;
  }
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final challengeDTO = ChallengeDTO.fromAppWriteJson(document.data);
      print('✅ existing Challenge - ${challengeDTO.id}');
      return challengeDTO;
    } else {
      throw Exception('Can not find Challenge by title: $title');
    }
  } catch (e) {
    print('ANDRII: _findChallenge: $title error $e');
    rethrow;
  }
}

Future<DailyPhraseDTO?> _findPhrase({
  required Databases database,
  required String collectionId,
  required String? title,
}) async {
  if (title == null) {
    return null;
  }

  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final dailyPhrase = DailyPhraseDTO.fromAppWriteJson(document.data);
      print('✅ hrase existing phrase - ${dailyPhrase.id}');
      return dailyPhrase;
    } else {
      throw Exception('Can not find hrase by title: $title');
    }
  } catch (e) {
    print('ANDRII: _findPhrase: $title error $e');
    rethrow;
  }
}
