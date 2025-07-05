import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_step_dto.dart';

Future<Map<TechniqueDTO, List<TechniqueStepDTO>>> parseTechniques() async {
  final listOfFilesDailyTasks = [
    'assets/content/psychological_techniques/category_relationship_crisis/emotional_detox.json',
    'assets/content/psychological_techniques/category_relationship_crisis/empathy_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/fantasy_map_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/forgiveness_practice.json',
    'assets/content/psychological_techniques/category_relationship_crisis/method_5_to_1.json',
    'assets/content/psychological_techniques/category_relationship_crisis/mirroring_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/ninety_second_rule.json',
    'assets/content/psychological_techniques/category_relationship_crisis/partner_dialogue.json',
    'assets/content/psychological_techniques/category_relationship_crisis/rewrite_the_story.json',
    'assets/content/psychological_techniques/category_relationship_crisis/safe_word_technique.json',
    'assets/content/psychological_techniques/category_relationship_crisis/safety_point.json',
    'assets/content/psychological_techniques/category_relationship_crisis/shared_goals_and_plans.json',
    'assets/content/psychological_techniques/category_relationship_crisis/symbolic_actions.json',
    'assets/content/psychological_techniques/category_relationship_crisis/visualizing_ideal_dialogue.json',
    'assets/content/psychological_techniques/category_relationship_crisis/psychological_technique_conflict_resolution_translated.json',
    'assets/content/psychological_techniques/category_relationship_crisis/psychological_technique_role_reversal.json',
    'assets/content/psychological_techniques/category_relationship_crisis/emotional_barometer_technique.json',
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
    'assets/content/psychological_techniques/category_sexual_closeness/additionals/desire-scenario.json',
    'assets/content/psychological_techniques/category_sexual_closeness/additionals/divided-initiative.json',
    'assets/content/psychological_techniques/category_sexual_closeness/additionals/fantasy-in-detail.json',
    'assets/content/psychological_techniques/category_sexual_closeness/additionals/forbidden-allowed-game.json',
    'assets/content/psychological_techniques/category_sexual_closeness/additionals/intimate-memories-game.json',
    'assets/content/psychological_techniques/category_sexual_closeness/additionals/my-three-desires-game.json',
    'assets/content/psychological_techniques/category_relationship_crisis/additionals/mutual-gratitude-journal.json',
    'assets/content/psychological_techniques/category_relationship_crisis/additionals/openness-ritual-about-fears.json',
    'assets/content/psychological_techniques/category_relationship_crisis/additionals/rewrite-conflict-story.json',
    'assets/content/psychological_techniques/category_relationship_crisis/additionals/shared-future-wish.json',
    'assets/content/psychological_techniques/category_relationship_crisis/additionals/shared-list-of-pain-and-joy.json',
    'assets/content/psychological_techniques/category_relationship_crisis/additionals/symbolic-forgiveness-gift.json',
  ];

  var techniquesWithSteps = <TechniqueDTO, List<TechniqueStepDTO>>{};

  for (final filePath in listOfFilesDailyTasks) {
    final content = await getFileDataMap(filePath);

    final techniqueMap = content['technique'] as Map<String, dynamic>;
    final techniqueStepsDynamicList = content['technique_steps'] as List<dynamic>;

    var techniqueDTO = TechniqueDTO.fromJson(techniqueMap);
    techniqueDTO = techniqueDTO.categoryId == 'sexual_intimacy'
        ? techniqueDTO.copyWith(categoryId: 'sexual_closeness')
        : techniqueDTO;
    final techniqueStepsDTO = techniqueStepsDynamicList.map(TechniqueStepDTO.fromDynamic).toList();

    if (techniqueDTO.categoryId == categoryId) {
      techniquesWithSteps[techniqueDTO] = techniqueStepsDTO;
    }
  }

  return techniquesWithSteps;
}

Future<void> writeToDataBaseTechnique() async {
  final database = getDataBase();

  const techniquesCollection = 'techniques';
  const techniqueStepsCollection = 'technique_steps';

  var techniquesWithSteps = await parseTechniques();

  techniquesWithSteps = await _createTechniques(
    database: database,
    techniquesCollectionId: techniquesCollection,
    techniquesStepCollectionId: techniqueStepsCollection,
    techniquesWithSteps: techniquesWithSteps,
  );

  log('\n\n=====START=============\n');
  for (final entry in techniquesWithSteps.entries) {
    log('${entry.key.id} - ${entry.key.categoryId} | ${entry.value.length}');
  }
  log('\n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
Future<Map<TechniqueDTO, List<TechniqueStepDTO>>> _createTechniques({
  required Databases database,
  required String techniquesCollectionId,
  required String techniquesStepCollectionId,
  required Map<TechniqueDTO, List<TechniqueStepDTO>> techniquesWithSteps,
}) async {
  final updatedChallenges = <TechniqueDTO, List<TechniqueStepDTO>>{};

  for (final entry in techniquesWithSteps.entries) {
    final technique = entry.key;
    final techniqueSteps = entry.value;

    try {
      final createdTechnique = await _createSingleTechnique(
        database: database,
        collectionId: techniquesCollectionId,
        technique: technique,
      );

      final createdTechniqueSteps = await _createTechniqueSteps(
        database: database,
        collectionId: techniquesStepCollectionId,
        technique: createdTechnique,
        steps: techniqueSteps,
      );

      updatedChallenges[createdTechnique] = createdTechniqueSteps;
    } catch (e) {
      print('ANDRII: e $e');
    }
  }

  return updatedChallenges;
}

Future<TechniqueDTO> _createSingleTechnique({
  required Databases database,
  required String collectionId,
  required TechniqueDTO technique,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('id', technique.id)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      print('ANDRII existing Technique - ${technique.id}');
      return TechniqueDTO.fromAppWriteJson(document.data);
    } else {
      final updatedTechnique = technique.copyWith(id: ID.unique());
      print('ANDRII ${technique.id} does not exist!');
      await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: technique.id,
        data: technique.toDataBaseJson(),
      );
      print('✅ Technique "${technique.id}" created.');
      return technique;
    }
  } catch (e) {
    print('ANDRII: _createSingleTechnique ${technique.id} error $e');
    rethrow;
  }
}

Future<List<TechniqueStepDTO>> _createTechniqueSteps({
  required Databases database,
  required String collectionId,
  required TechniqueDTO technique,
  required List<TechniqueStepDTO> steps,
}) async {
  final updatedSteps = <TechniqueStepDTO>[];

  for (final step in steps) {
    final stepBeforeUpdate = step.copyWith(
      id: ID.unique(),
      techniqueId: technique.id,
    );

    try {
      final response = await database.listDocuments(
        collectionId: collectionId,
        databaseId: databaseId,
        queries: [Query.equal('technique_id', stepBeforeUpdate.techniqueId)],
      );

      final document = response.documents
          .firstWhereOrNull((item) => (item.data['step_number'] as int) == stepBeforeUpdate.stepNumber);

      if (document != null) {
        print('ANDRII existing step');
        final stepFromAppWrite = TechniqueStepDTO.fromAppWriteJson(document.data);
        updatedSteps.add(stepFromAppWrite);
      } else {
        print('ANDRII ${stepBeforeUpdate.stepNumber} does not exist!');
        await database.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: stepBeforeUpdate.id,
          data: stepBeforeUpdate.toDataBaseJson(),
        );
        updatedSteps.add(stepBeforeUpdate);
        print('✅ Step "${stepBeforeUpdate.stepNumber}" created.');
      }
    } catch (e) {
      print('ANDRII: step error $e');
      rethrow;
    }
  }

  updatedSteps.forEach((item) {
    print('ANDRII ${item.stepNumber}');
  });

  return updatedSteps;
}
