import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';

Future<List<DailyTaskDTO>> parseDailyTask() async {
  final listOfFilesDailyPhrase = [
    // 'assets/content/daily_tasks/category_relationship_crisis/2-4.json',
    // 'assets/content/daily_tasks/category_relationship_crisis/5-7.json',
    // 'assets/content/daily_tasks/category_relationship_crisis/8-11.json',
    // 'assets/content/daily_tasks/category_relationship_crisis/12-15.json',
    // 'assets/content/daily_tasks/category_relationship_crisis/16-20.json',
    'assets/content/daily_tasks/category_relationship_crisis/20-23.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/1-5.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/6-10.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/11-15.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/16-21.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/22-26.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/27-30.json',
    // 'assets/content/daily_tasks/category_sexual_closeness/31-33.json',
  ];

  var dailyTasks = <DailyTaskDTO>[];

  for (final filePath in listOfFilesDailyPhrase) {
    final content = await getFileDataList(filePath);

    for (final dynamicData in content) {
      final task = DailyTaskDTO.fromDynamic(dynamicData);
      dailyTasks.add(task);
    }
  }

  return dailyTasks.where((item) => item.categoryId == categoryId).toList();
}

Future<void> writeToDataBaseDailyTasks() async {
  final database = getDataBase();

  const dailyTaskCollection = 'daily_tasks';

  var dailyTasks = await parseDailyTask();

  var uploadedDailyTasks = <DailyTaskDTO>[];
  for (final dailyTask in dailyTasks) {
    if (dailyTask.id == "dailytask_crisis_23") {
      final uploadedDailyTask = await _createSingleTask(
        database: database,
        collectionId: dailyTaskCollection,
        dailyTask: dailyTask,
      );
      uploadedDailyTasks.add(uploadedDailyTask);
    }
    // final uploadedDailyTask = await _createSingleTask(
    //   database: database,
    //   collectionId: dailyTaskCollection,
    //   dailyTask: dailyTask,
    // );
    // uploadedDailyTasks.add(uploadedDailyTask);
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
