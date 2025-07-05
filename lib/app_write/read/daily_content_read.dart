import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/daily_content_with_models_dto.dart';
import 'package:iteo_libraries_example/app_write/logs/cocntent_logs.dart';

Future<void> readDataBaseDailyContents() async {
  final database = getDataBase();

  const dailyContentCollection = 'daily_content';

  await showLogsFromJson();

  log('\n\n========= SERVER ===========\n\n');

  final dataList = await _getData(
    database: database,
    collectionId: dailyContentCollection,
    categoryId: categoryId,
  );

  checkForDuplicated(dataList);
  showLogDays(dataList);
}

Future<List<DailyContentWithModelsDTO>> _getData({
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

    return response.documents.map((document) => DailyContentWithModelsDTO.fromJson(document.data)).toList();
  } catch (e) {
    print('ANDRII: _getDailyContentsByCategory error: $e');
    rethrow;
  }
}

void showLogDays(List<DailyContentWithModelsDTO> dataList) {
  log('\n\n');
  for (final dailyContent in dataList) {
    log('Day: ${dailyContent.dayNumber}');
    log('phraseTitle: ${dailyContent.phrase.phrase.en}');
    log('techniqueTitle: ${dailyContent.technique?.title.en}');
    log('testTitle: ${dailyContent.test?.title.en}');
    log('challengeTitle: ${dailyContent.challenge?.title.en}');
    log('dailyTaskTitle: ${dailyContent.dailyTask?.title.en}');
    log('\n\n');
  }
}

void checkForDuplicated(List<DailyContentWithModelsDTO> dataList) {
  final phrases = dataList.map((item) => item.phrase.phrase.en).toList();
  final dailyTasks = dataList.map((item) => item.dailyTask?.title.en).toList();
  final challenges = dataList.map((item) => item.challenge?.title.en).toList();
  final tests = dataList.map((item) => item.test?.title.en).toList();
  final techniques = dataList.map((item) => item.technique?.title.en).toList();

  showDuplicates('phrases', phrases);
  showDuplicates('dailyTasks', dailyTasks);
  showDuplicates('challenges', challenges);
  showDuplicates('techniques', techniques);
  showDuplicates('tests', tests);
}

void showDuplicates(String key, List<String?> titles) {
  final Map<String?, int> counts = {};
  for (final title in titles) {
    counts[title] = (counts[title] ?? 0) + 1;
  }
  final duplicates = counts.entries.where((entry) => entry.value > 1).toList();
  log('====== Duplicates for $key:\n');
  for (final entry in duplicates) {
    log('Value: "${entry.key}"  —  Count: ${entry.value}');
  }
  log('\n\n');
}
