import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/daily_task/daily_task_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_step_dto.dart';

//TODO task: compare all challenge models if everything was created with success

const databaseId = '68225f7d0027204d0c21';

Future<Map<String, dynamic>> _getFileData(String path) async {
  final String jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString) as Map<String, dynamic>;
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

Future<void> writeToDataBaseTechnique() async {
  final database = _getDataBase();

  const techniquesCollection = 'techniques';
  const techniqueStepsCollection = 'technique_steps';

  final listOfFilesDailyTasks = [
    'assets/content/psychological_techniques/category_relationship_crisis/emotional_barometer_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/emotional_detox.json',
    'assets/content/psychological_techniques/category_relationship_crisis/empathy_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/fantasy_map_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/forgiveness_practice.json',
    'assets/content/psychological_techniques/category_relationship_crisis/method_5_to_1.json',
    'assets/content/psychological_techniques/category_relationship_crisis/mirroring_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/ninety_second_rule.json',
    'assets/content/psychological_techniques/category_relationship_crisis/partner_dialogue.json',
    'assets/content/psychological_techniques/category_relationship_crisis/psychological_technique_conflict_resolution_translated.json',
    'assets/content/psychological_techniques/category_relationship_crisis/psychological_technique_role_reversal.json',
    'assets/content/psychological_techniques/category_relationship_crisis/rewrite_the_story.json',
    'assets/content/psychological_techniques/category_relationship_crisis/safe_word_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/safety_point.json',
    'assets/content/psychological_techniques/category_relationship_crisis/shared_goals_and_plans.json',
    'assets/content/psychological_techniques/category_relationship_crisis/symbolic_actions.json',
    'assets/content/psychological_techniques/category_relationship_crisis/visualizing_ideal_dialogue.json',
    'assets/content/psychological_techniques/category_sexual_closeness/frank_questions.json',
    'assets/content/psychological_techniques/category_sexual_closeness/gentle_tease.json',
    'assets/content/psychological_techniques/category_sexual_closeness/hot_or_cold.json',
    'assets/content/psychological_techniques/category_sexual_closeness/kiss_intensity_mapping.json',
    'assets/content/psychological_techniques/category_sexual_closeness/kissing_map.json',
    'assets/content/psychological_techniques/category_sexual_closeness/role_play_scenarios.json',
    'assets/content/psychological_techniques/category_sexual_closeness/secret_desire_list.json',
    'assets/content/psychological_techniques/category_sexual_closeness/secret_wishlist.json',
    'assets/content/psychological_techniques/category_sexual_closeness/sex_001.json',
    'assets/content/psychological_techniques/category_sexual_closeness/sex_free_evening.json',
    'assets/content/psychological_techniques/category_sexual_closeness/touch_cues.json',
  ];

  final techniquesWithSteps = <TechniqueDTO, List<TechniqueStepDTO>>{};

  for (final filePath in listOfFilesDailyTasks) {
    final content = await _getFileData(filePath);

    final techniqueMap = content['technique'] as Map<String, dynamic>;
    final techniqueStepsDynamicList = content['technique_steps'] as List<dynamic>;

    try {
      final techniqueDTO = TechniqueDTO.fromJson(techniqueMap);
    } catch (ex) {
      log("Error: $ex\n$techniqueMap");
    }
    final techniqueDTO = TechniqueDTO.fromJson(techniqueMap);
    final techniqueStepsDTO = techniqueStepsDynamicList.map(TechniqueStepDTO.fromDynamic).toList();
    techniquesWithSteps[techniqueDTO] = techniqueStepsDTO;
  }

  // for (final dailyTask in dailyTasks) {
  //   await _createSingleTask(
  //     database: database,
  //     collectionId: dailyTaskCollection,
  //     dailyTask: dailyTask,
  //   );
  // }

  log('\n\n=====START=============\n');
  for (final entry in techniquesWithSteps.entries) {
    log('${entry.key.id} - ${entry.key.categoryId} | ${entry.value.length}');
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
