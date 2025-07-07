import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_phrase/daily_phrase_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';

Future<List<DailyPhraseDTO>> parseDailyPhrase() async {
  final listOfFilesDailyPhrase = [
    'assets/content/daily_phrase/category_sexual_closeness/1-60.json',
    'assets/content/daily_phrase/category_relationship_crisis/1-60.json',
  ];

  var dailyPhrase = <DailyPhraseDTO>[];

  for (final filePath in listOfFilesDailyPhrase) {
    final content = await getFileDataList(filePath);

    for (final dynamicData in content) {
      final task = DailyPhraseDTO.fromDynamic(dynamicData);
      dailyPhrase.add(task);
    }
  }

  return dailyPhrase.where((item) => item.categoryId == categoryId).toList();
}

Future<void> writeToDataBaseDailyPhrase() async {
  final database = getDataBase();

  const dailyTaskCollection = 'daily_tasks';

  final dailyTasks = await parseDailyPhrase();

  var uploadedDailyTasks = <DailyTaskDTO>[];
  // for (final dailyTask in dailyTasks) {
  //   final uploadedDailyTask = await _createSingleTask(
  //     database: database,
  //     collectionId: dailyTaskCollection,
  //     dailyTask: dailyTask,
  //   );
  //   uploadedDailyTasks.add(uploadedDailyTask);
  // }

  log('\n\n=====START=============\n');
  for (final uploadedDailyTask in uploadedDailyTasks) {
    log('${uploadedDailyTask.id} - ${uploadedDailyTask.categoryId} | ${uploadedDailyTask.title.languages.entries.last.value}');
  }
  log('\n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
Future<DailyTaskDTO> _createSingleTask({
  required Databases database,
  required String collectionId,
  required DailyTaskDTO dailyTask,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('id', dailyTask.id)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      print('ANDRII existing phrase - ${dailyTask.id}');
      return DailyTaskDTO.fromAppWriteJson(document.data);
    } else {
      print('ANDRII ${dailyTask.id} does not exist!');
      await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: dailyTask.id,
        data: dailyTask.toDataBaseJson(),
      );
      print('✅ Daily task "${dailyTask.id}" created.');
      return dailyTask;
    }
  } catch (e) {
    print('ANDRII: _createSingleChallenge ${dailyTask.id} error $e');
    rethrow;
  }
}
