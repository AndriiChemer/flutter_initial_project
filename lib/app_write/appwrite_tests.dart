import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/technique/technique_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/technique/technique_step_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_dto.dart';

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

Future<void> writeToDataBaseTests() async {
  // final database = _getDataBase();

  const testsCollection = 'tests';
  const testQuestionsCollection = 'test_questions';

  final listOfFilesTests = [
    'assets/content/tests/category_relationship_crisis/compromise_level_test.json',
    'assets/content/tests/category_relationship_crisis/conflict_behavior_level.json',
    'assets/content/tests/category_relationship_crisis/conflict_behavior_patterns_check.json',
    'assets/content/tests/category_relationship_crisis/conflict_pattern_detection.json',
    'assets/content/tests/category_relationship_crisis/conflict_reason_test.json',
    'assets/content/tests/category_relationship_crisis/conflict_reasons_understanding.json',
    'assets/content/tests/category_relationship_crisis/conflict_resolution_in_relationship.json',
    'assets/content/tests/category_relationship_crisis/conflict_resolution_styles.json',
    'assets/content/tests/category_relationship_crisis/cooperation_level_test.json',
    'assets/content/tests/category_relationship_crisis/crisis_depth_test.json',
    'assets/content/tests/category_relationship_crisis/emotional_barriers_in_relationship.json',
    'assets/content/tests/category_relationship_crisis/emotional_closeness_empathy_test.json',
    'assets/content/tests/category_relationship_crisis/emotional_closeness_in_crisis.json',
    'assets/content/tests/category_relationship_crisis/emotional_closeness_level_test.json',
    'assets/content/tests/category_relationship_crisis/emotional_distance_level.json',
    'assets/content/tests/category_relationship_crisis/emotional_distance_level_2.json',
    'assets/content/tests/category_relationship_crisis/emotional_resilience_test.json',
    'assets/content/tests/category_relationship_crisis/empathy_level_quiz.json',
    'assets/content/tests/category_relationship_crisis/intimacy_barriers.json',
    'assets/content/tests/category_relationship_crisis/intimacy_barriers_2.json',
    'assets/content/tests/category_relationship_crisis/listening_skills_test.json',
    'assets/content/tests/category_relationship_crisis/relationship-tension-level.json',
    'assets/content/tests/category_relationship_crisis/relationship_problem_areas.json',
    'assets/content/tests/category_relationship_crisis/relationship_strengths_quiz.json',
    'assets/content/tests/category_relationship_crisis/relationship_stress.json',
    'assets/content/tests/category_relationship_crisis/relationship_support_check.json',
    'assets/content/tests/category_relationship_crisis/trust_and_support.json',
    'assets/content/tests/category_relationship_crisis/unspoken_emotions.json',
    'assets/content/tests/category_sexual_closeness/boundaries_and_comfort.json',
    'assets/content/tests/category_sexual_closeness/erotic_profile.json',
    'assets/content/tests/category_sexual_closeness/hidden_fantasies_test.json',
    'assets/content/tests/category_sexual_closeness/hidden_sexual_desires.json',
    'assets/content/tests/category_sexual_closeness/intimacy_barriers_sexual.json',
    'assets/content/tests/category_sexual_closeness/relationships_level_openness.json',
    'assets/content/tests/category_sexual_closeness/sexual_desires_openness.json',
    'assets/content/tests/category_sexual_closeness/sexual_experiments_openness.json',
    'assets/content/tests/category_sexual_closeness/sexual_interests_and_desires.json',
    'assets/content/tests/category_sexual_closeness/sexual_interests_and_desires_2.json',
    'assets/content/tests/category_sexual_closeness/sexual_life_satisfaction.json',
    'assets/content/tests/category_sexual_closeness/sexual_openness_level.json',
    'assets/content/tests/category_sexual_closeness/sexual_openness_score.json',
    'assets/content/tests/category_sexual_closeness/sexual_psychotype.json',
    'assets/content/tests/category_sexual_closeness/sexual_style.json',
    'assets/content/tests/category_sexual_closeness/sexual_vocabulary_quiz.json',
    'assets/content/tests/category_sexual_closeness/unspoken_desires.json',
  ];

  // Medium, High, Deep, For all, Intermediate, Advanced, Easy, For couples in crisis
  var testDTOList = <TestDTO>[];

  for (final filePath in listOfFilesTests) {
    final dataMap = await _getFileData(filePath);

    final testDTO = TestDTO.fromJson(dataMap);
    testDTOList.add(testDTO);
  }

  // techniquesWithSteps = await _createTechniques(
  //   database: database,
  //   techniquesCollectionId: techniquesCollection,
  //   techniquesStepCollectionId: techniqueStepsCollection,
  //   techniquesWithSteps: techniquesWithSteps,
  // );

  log('\n\n=====START=============\n');
  for (final testDTO in testDTOList) {
    log('${testDTO.level}');
    // log('${testDTO.id} - ${testDTO.categoryId} | ${testDTO.level.languages.entries.first.value}');
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

  for (final stepBeforeUpdate in steps) {
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
