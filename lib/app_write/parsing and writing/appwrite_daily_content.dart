import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/daily_content/daily_content_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/daily_content/json/daily_content_json_dto.dart';

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
Future<DailyContentDTO> _createSingleDailyContent({
  required Databases database,
  required String collectionId,
  required DailyContentDTO dailyContentBeforeUpdate,
}) async {
  final dailyContent = dailyContentBeforeUpdate.copyWith(id: ID.unique());
  try {
    print('ANDRII ${dailyContent.id} does not exist!');

    await database.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: dailyContent.id,
      data: dailyContent.toDataBaseJson(),
    );
    print('✅ Course "${dailyContent.id}" created.');
    return dailyContent;
  } catch (e) {
    print('ANDRII: _createSingleCourse ${dailyContent.id} | ${dailyContent.dayNumber} error $e');
    rethrow;
  }
}
