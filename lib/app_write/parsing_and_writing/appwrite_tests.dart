import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/test/test_question_dto.dart';

Future<List<TestDTO>> parseTests() async {
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
    'assets/content/tests/category_relationship_crisis/emotional_closeness_in_crisis.json',
    'assets/content/tests/category_relationship_crisis/emotional_closeness_level_test.json',
    'assets/content/tests/category_relationship_crisis/emotional_distance_level.json',
    'assets/content/tests/category_relationship_crisis/emotional_resilience_test.json',
    'assets/content/tests/category_relationship_crisis/empathy_level_quiz.json',
    'assets/content/tests/category_relationship_crisis/intimacy_barriers.json',
    'assets/content/tests/category_relationship_crisis/listening_skills_test.json',
    'assets/content/tests/category_relationship_crisis/relationship-tension-level.json',
    'assets/content/tests/category_relationship_crisis/relationship_problem_areas.json',
    'assets/content/tests/category_relationship_crisis/relationship_strengths_quiz.json',
    'assets/content/tests/category_relationship_crisis/relationship_stress.json',
    'assets/content/tests/category_relationship_crisis/relationship_support_check.json',
    'assets/content/tests/category_relationship_crisis/trust_and_support.json',
    'assets/content/tests/category_relationship_crisis/unspoken_emotions.json',
    'assets/content/tests/category_relationship_crisis/emotional_distance_level_2.json',
    'assets/content/tests/category_relationship_crisis/intimacy_barriers_2.json',
    'assets/content/tests/category_relationship_crisis/emotional_closeness_empathy_test.json',
    'assets/content/tests/category_sexual_closeness/boundaries_and_comfort.json',
    'assets/content/tests/category_sexual_closeness/erotic_profile.json',
    'assets/content/tests/category_sexual_closeness/hidden_fantasies_test.json',
    'assets/content/tests/category_sexual_closeness/hidden_sexual_desires.json',
    'assets/content/tests/category_sexual_closeness/intimacy_barriers_sexual.json',
    'assets/content/tests/category_sexual_closeness/relationships_level_openness.json',
    'assets/content/tests/category_sexual_closeness/sexual_experiments_openness.json',
    'assets/content/tests/category_sexual_closeness/sexual_interests_and_desires.json',
    'assets/content/tests/category_sexual_closeness/sexual_life_satisfaction.json',
    'assets/content/tests/category_sexual_closeness/sexual_openness_level.json',
    'assets/content/tests/category_sexual_closeness/sexual_openness_score.json',
    'assets/content/tests/category_sexual_closeness/sexual_psychotype.json',
    'assets/content/tests/category_sexual_closeness/sexual_style.json',
    'assets/content/tests/category_sexual_closeness/sexual_vocabulary_quiz.json',
    'assets/content/tests/category_sexual_closeness/unspoken_desires.json',
    'assets/content/tests/category_sexual_closeness/sexual_interests_and_desires_2.json',
    'assets/content/tests/category_sexual_closeness/sexual_desires_openness.json',
  ];

  var testDTOList = <TestDTO>[];

  for (final filePath in listOfFilesTests) {
    final dataMap = await getFileDataMap(filePath);

    final testDTO = TestDTO.fromJson(dataMap);
    testDTOList.add(testDTO);
  }

  return testDTOList.where((item) => item.categoryId == categoryId).toList();
}

Future<void> writeToDataBaseTests() async {
  final database = getDataBaseProd();

  const testsCollection = 'tests';
  const testQuestionsCollection = 'test_questions';

  var testDTOList = await parseTests();

  final testsWithQuestions = await _createTests(
    database: database,
    testCollectionId: testsCollection,
    testQuestionCollectionId: testQuestionsCollection,
    tests: testDTOList,
  );

  log('\n\n=====START=============\n');
  for (final testDTOEntry in testsWithQuestions.entries) {
    log('ID: ${testDTOEntry.key.id} | Questions: ${testDTOEntry.value.length}');
  }
  log('\n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
Future<Map<TestDTO, List<TestQuestionDTO>>> _createTests({
  required Databases database,
  required String testCollectionId,
  required String testQuestionCollectionId,
  required List<TestDTO> tests,
}) async {
  final updatedTestQuestions = <TestDTO, List<TestQuestionDTO>>{};

  for (final test in tests) {
    final testQuestions = test.questions;

    try {
      final createdTest = await _createSingleTest(
        database: database,
        collectionId: testCollectionId,
        test: test,
      );

      final createdTechniqueSteps = await _createTestQuestions(
        database: database,
        collectionId: testQuestionCollectionId,
        questions: testQuestions,
      );

      updatedTestQuestions[createdTest] = createdTechniqueSteps;
    } catch (e) {
      print('ANDRII: e $e');
    }
  }

  return updatedTestQuestions;
}

Future<TestDTO> _createSingleTest({
  required Databases database,
  required String collectionId,
  required TestDTO test,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: prodDatabaseId,
      queries: [Query.equal('id', test.id)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      print('ANDRII existing Test - ${test.id}');
      return TestDTO.fromAppWriteJson(document.data);
    } else {
      print('ANDRII ${test.id} does not exist!');
      await database.createDocument(
        databaseId: prodDatabaseId,
        collectionId: collectionId,
        documentId: test.id,
        data: test.toDataBaseJson(),
      );
      print('✅ Technique "${test.id}" created.');
      return test;
    }
  } catch (e) {
    print('ANDRII: _createSingleTest ${test.id} error $e');
    rethrow;
  }
}

Future<List<TestQuestionDTO>> _createTestQuestions({
  required Databases database,
  required String collectionId,
  required List<TestQuestionDTO> questions,
}) async {
  final updatedQuestion = <TestQuestionDTO>[];

  for (final question in questions) {
    final questionBeforeUpdate = question.copyWith(id: ID.unique());
    try {
      final response = await database.listDocuments(
        collectionId: collectionId,
        databaseId: prodDatabaseId,
        queries: [Query.equal('test_id', questionBeforeUpdate.testId)],
      );

      final document =
          response.documents.firstWhereOrNull((item) => (item.data['number'] as int) == questionBeforeUpdate.number);

      if (document != null) {
        print('ANDRII existing step');
        final questionFromAppWrite = TestQuestionDTO.fromAppWriteJson(document.data);
        updatedQuestion.add(questionFromAppWrite);
      } else {
        print('ANDRII ${questionBeforeUpdate.number} does not exist!');

        await database.createDocument(
          databaseId: prodDatabaseId,
          collectionId: collectionId,
          documentId: questionBeforeUpdate.id,
          data: questionBeforeUpdate.toDataBaseJson(),
        );
        updatedQuestion.add(questionBeforeUpdate);
        print('✅ Step "${questionBeforeUpdate.number}" created.');
      }
    } catch (e) {
      print('ANDRII: ERROR Question ID: ${questionBeforeUpdate} - ${questionBeforeUpdate.number} error $e');
      print('ANDRII: ERROR Question ID: createdIDS: ${updatedQuestion.map((item) => item.id)}');
      rethrow;
    }
  }

  updatedQuestion.forEach((item) {
    print('ANDRII ${item.number}');
  });

  return updatedQuestion;
}
