import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/daily_phrase/daily_phrase_dto.dart';

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

Future<void> writeToDataBaseDailyPhrase() async {
  final database = _getDataBase();

  const dailyPhraseCollection = 'daily_phrases';

  final listOfFilesDailyPhrases = [
    'assets/content/daily_phrase/category_relationship_crisis/1-60.json',
    'assets/content/daily_phrase/category_sexual_closeness/1-60.json',
  ];

  var dailyPhrases = <DailyPhraseDTO>[];

  for (final filePath in listOfFilesDailyPhrases) {
    final content = await _getFileData(filePath);
    final dtos = content.map((dynamic dynamicData) => DailyPhraseDTO.fromDynamic(dynamicData)).toList();
    dailyPhrases.addAll(dtos);
  }

  // for (final dailyPhrase in dailyPhrases) {
  //   await _createSinglePhrase(
  //     database: database,
  //     collectionId: dailyPhraseCollection,
  //     dailyPhrase: dailyPhrase,
  //   );
  // }

  // log('ANDRII \n\n=====START=============\n');
  // for (final dailyPhrase in dailyPhrases) {
  //   log('${dailyPhrase.categoryId} - ${dailyPhrase.phrase.languages}');
  // }
  // log('ANDRII \n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
Future<DailyPhraseDTO> _createSinglePhrase({
  required Databases database,
  required String collectionId,
  required DailyPhraseDTO dailyPhrase,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('id', dailyPhrase.id)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      print('ANDRII existing phrase - ${dailyPhrase.id}');
      return DailyPhraseDTO.fromAppWriteJson(document.data);
    } else {
      print('ANDRII ${dailyPhrase.id} does not exist!');
      await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: dailyPhrase.id,
        data: dailyPhrase.toDataBaseJson(),
      );
      print('✅ Daily phrase "${dailyPhrase.id}" created.');
      return dailyPhrase;
    }
  } catch (e) {
    print('ANDRII: _createSingleChallenge ${dailyPhrase.id} error $e');
    rethrow;
  }
}
