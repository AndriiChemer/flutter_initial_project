import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/daily_content_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/json/daily_content_json_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_phrase/daily_phrase_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_dto.dart';

Future<List<DailyContentJsonDTO>> parseDailyContentJsonDTO() async {
  final listOfFilesDailyContents = [
    'assets/content/daily_content/category_relationship_crisis/1-24-days.json',
    'assets/content/daily_content/category_sexual_closeness/1-25-days.json',
  ];

  var dailyContentsJsons = <DailyContentJsonDTO>[];

  for (final filePath in listOfFilesDailyContents) {
    final contentList = await getFileDataList(filePath);

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
  return dailyContentsJsons.where((item) => item.categoryId == categoryId).toList();
}

Future<void> writeToDataBaseDailyContents() async {
  final database = getDataBaseProd();

  const dailyContentCollection = 'daily_content';

  var dailyContentsJsons = await parseDailyContentJsonDTO();

  final half = (dailyContentsJsons.length / 2).ceil();
  final firstPart = dailyContentsJsons.sublist(0, half);
  final secondPart = dailyContentsJsons.sublist(half);

  // final all = [...firstPart];
  final all = [...secondPart];

  for (final item in all) {
    log('${item.courseId} - ${item.dayNumber}');
  }

  var createdDailyContents = <DailyContentDTO>[];
  log('\n\n');
  for (final dailyContent in all) {
    log('Day: ${dailyContent.dayNumber}');
    log("phraseTitle: ${dailyContent.phraseTitle}");
    log("techniqueTitle: ${dailyContent.techniqueTitle}");
    log("testTitle: ${dailyContent.testTitle}");
    log("challengeTitle: ${dailyContent.challengeTitle}");
    log("dailyTaskTitle: ${dailyContent.dailyTaskTitle}");
    log('\n\n');
    final createdCourse = await _createSingleDailyContent(
      database: database,
      collectionId: dailyContentCollection,
      dailyContentBeforeUpdate: dailyContent,
    );
    createdDailyContents.add(createdCourse);
  }

  log('ANDRII \n\n=====START=============\n');
  final phrases = createdDailyContents.map((item) => item.phraseId).toList();
  final dailyTasks = createdDailyContents.map((item) => item.dailyTaskId).toList();
  final challenges = createdDailyContents.map((item) => item.challengeId).nonNulls.toList();
  final tests = createdDailyContents.map((item) => item.testId).nonNulls.toList();
  final techniques = createdDailyContents.map((item) => item.techniqueId).nonNulls.toList();
  log('Course - phrases: ${phrases.length} | dailyTasks: ${dailyTasks.length} | challenges: ${challenges.length} | tests: ${tests.length} | techniques: ${techniques.length}');
  log('ANDRII \n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
Future<DailyContentDTO> _createSingleDailyContent({
  required Databases database,
  required String collectionId,
  required DailyContentJsonDTO dailyContentBeforeUpdate,
}) async {
  final dailyContentJson = dailyContentBeforeUpdate.copyWith(
    id: ID.unique(),
  );
  try {
    final testDTO = await _findTest(
      database: database,
      collectionId: 'tests',
      title: dailyContentJson.testTitle,
    );

    final techniqueDTO = await _findTechnique(
      database: database,
      collectionId: 'techniques',
      title: dailyContentJson.techniqueTitle,
    );

    final dailyTaskDTO = await _findDailyTask(
      database: database,
      collectionId: 'daily_tasks',
      title: dailyContentJson.dailyTaskTitle,
    );

    final challengeDTO = await _findChallenge(
      database: database,
      collectionId: 'challenges',
      title: dailyContentJson.challengeTitle,
    );

    final phraseDTO = await _findPhrase(
      database: database,
      collectionId: 'daily_phrases',
      title: dailyContentJson.phraseTitle,
    );

    final dailyContent = DailyContentDTO.fromDailyContentJsonDTO(
      dailyContentJsonDTO: dailyContentJson,
      phraseId: phraseDTO.id,
      dailyTaskId: dailyTaskDTO?.id,
      challengeId: challengeDTO?.id,
      techniqueId: techniqueDTO?.id,
      testId: testDTO?.id,
    );

    log('DailyContent: ${dailyContent.toJson()}');

    //TODO create DailyContent with ids:

    await database.createDocument(
      databaseId: prodDatabaseId,
      collectionId: collectionId,
      documentId: dailyContent.id,
      data: dailyContent.toDataBaseJson(),
    );

    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: prodDatabaseId,
      queries: [Query.contains('id', dailyContent.id)],
    );

    final document = response.documents.firstOrNull;
    if (document != null) {
      print('✅ DailyContent created.\n');
      return DailyContentDTO.fromAppWriteJson(document.data);
    }

    print('DailyContent not created.\n');
    return dailyContent;
  } catch (e) {
    print('ANDRII: _createSingleCourse ${dailyContentJson.id} | ${dailyContentJson.dayNumber} error $e');
    rethrow;
  }
}

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
      databaseId: prodDatabaseId,
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
      databaseId: prodDatabaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final techniqueDTO = TechniqueDTO.fromAppWriteJson(document.data);
      print('✅ existing Technique - ${techniqueDTO.id}');
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
    // return throw Exception('Daily task can not be null. Title:  $title');
  }

  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: prodDatabaseId,
      queries: [Query.contains('title_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final dailyTaskDTO = DailyTaskDTO.fromAppWriteJson(document.data);
      print('✅ existing DailyTask existing phrase - ${dailyTaskDTO.id}');
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
      databaseId: prodDatabaseId,
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

Future<DailyPhraseDTO> _findPhrase({
  required Databases database,
  required String collectionId,
  required String? title,
}) async {
  if (title == null) {
    return throw Exception('Phrase can not be null. Title:  $title');
  }

  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: prodDatabaseId,
      queries: [Query.contains('phrase_json', title)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      final dailyPhrase = DailyPhraseDTO.fromAppWriteJson(document.data);
      print('✅ phrase existing phrase - ${dailyPhrase.id}');
      return dailyPhrase;
    } else {
      throw Exception('Can not find hrase by title: $title');
    }
  } catch (e) {
    print('ANDRII: _findPhrase: $title error $e');
    rethrow;
  }
}
