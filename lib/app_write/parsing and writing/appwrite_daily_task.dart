import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';

//TODO task: compare all challenge models if everything was created with success

const databaseId = '68225f7d0027204d0c21';

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

Future<void> writeToDataBaseDailyTasks() async {
  final database = _getDataBase();

  const dailyTaskCollection = 'daily_tasks';

  final listOfFilesDailyTasks = [
    'assets/content/daily_tasks/category_relationship_crisis/2-4.json',
    'assets/content/daily_tasks/category_relationship_crisis/5-7.json',
    'assets/content/daily_tasks/category_relationship_crisis/8-11.json',
    'assets/content/daily_tasks/category_relationship_crisis/12-15.json',
    'assets/content/daily_tasks/category_relationship_crisis/16-20.json',
    'assets/content/daily_tasks/category_sexual_closeness/1-5.json',
    'assets/content/daily_tasks/category_sexual_closeness/6-10.json',
    'assets/content/daily_tasks/category_sexual_closeness/11-15.json',
    'assets/content/daily_tasks/category_sexual_closeness/16-21.json',
    'assets/content/daily_tasks/category_sexual_closeness/22-26.json',
    'assets/content/daily_tasks/category_sexual_closeness/27-30.json',
    'assets/content/daily_tasks/category_sexual_closeness/31-33.json',
  ];

  var dailyTasks = <DailyTaskDTO>[];

  for (final filePath in listOfFilesDailyTasks) {
    final content = await _getFileData(filePath);

    for (final dynamicData in content) {
      final task = DailyTaskDTO.fromDynamic(dynamicData);
      dailyTasks.add(task);
    }
  }

  var uploadedDailyTasks = <DailyTaskDTO>[];
  for (final dailyTask in dailyTasks) {
    final uploadedDailyTask = await _createSingleTask(
      database: database,
      collectionId: dailyTaskCollection,
      dailyTask: dailyTask,
    );
    uploadedDailyTasks.add(uploadedDailyTask);
  }

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
