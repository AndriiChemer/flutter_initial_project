import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/daily_content_with_models_dto.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_daily_content.dart';

Future<void> compareDailyContents() async {
  final database = getDataBase();

  const dailyContentCollection = 'daily_content';

  log('\n\n========= SERVER ===========\n\n');

  final dataList = await _getData(
    database: database,
    collectionId: dailyContentCollection,
    categoryId: categoryId,
  );
  final dataListJsons = await parseDailyContentJsonDTO();

  for (var i = 0; i < dataList.length; i++) {
    final data = dataList[i];
    final dataJson = dataListJsons[i];

    final isSameTechnique = data.technique?.title.en == dataJson.techniqueTitle;
    final isSamePhrase = data.phrase.phrase.en == dataJson.phraseTitle;
    final isSameChallenge = data.challenge?.title.en == dataJson.challengeTitle;
    final isSameTask = data.dailyTask?.title.en == dataJson.dailyTaskTitle;

    log('DailyContent | Day: ${data.dayNumber} is same: ${isSameTechnique && isSamePhrase && isSameChallenge && isSameTask}');

    // final isSameTechnique = data.technique?.title.en == dataJson.techniqueTitle;

    // log('Technique | Day: ${data.dayNumber} is same: ${data.technique?.title.en == dataJson.techniqueTitle}');
    // log('Phrase | Day: ${data.dayNumber} is same: ${data.phrase.phrase.en == dataJson.phraseTitle}');
    // log('Challenge | Day: ${data.dayNumber} is same: ${data.challenge?.title.en == dataJson.challengeTitle}');
    // log('Task | Day: ${data.dayNumber} is same: ${data.dailyTask?.title.en == dataJson.dailyTaskTitle}');
  }
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
