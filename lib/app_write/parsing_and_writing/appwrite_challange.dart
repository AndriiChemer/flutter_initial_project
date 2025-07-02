import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/category/category_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/category/subcategory_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_step_dto.dart';

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

Future<void> writeToDataBaseChallenges() async {
  final database = _getDataBase();

  const categoryCollection = 'categories';
  const subcategoryCollection = 'subcategory';
  const challengeCollection = 'challenges';
  const stepCollection = 'challenge_steps';

  final listOfFilesChallenges = [
    'assets/content/challanges/challanges_without_subcategory.json',
    'assets/content/challanges/communication_challenges.json',
    'assets/content/challanges/conflicts_and_quarrels_challenges.json',
    'assets/content/challanges/daily_life_routine_challenges.json',
    'assets/content/challanges/distance_and_coldness_challenges_v2.json',
    'assets/content/challanges/reconnection_after_breakup_challenges.json',
    'assets/content/challanges/sexual_closeness_advanced_challenges_final.json',
    'assets/content/challanges/sexual_closeness_by_subcategory.json',
    'assets/content/challanges/multy_days/multi_day_arousal_game_3_days.json',
    'assets/content/challanges/multy_days/multi_day_boundless_fantasies.json',
    'assets/content/challanges/multy_days/multi_day_everyday_intimacy.json',
    'assets/content/challanges/multy_days/multi_day_five_nights_of_desire_tips_translated.json',
    'assets/content/challanges/multy_days/multi_day_game_of_desire.json',
    'assets/content/challanges/multy_days/multi_day_roleplay_another_me.json',
    'assets/content/challanges/multy_days/multi_day_safe_intimacy_restart.json',
  ];

  var categories = <CategoryDTO>[];
  var subcategories = <SubcategoryDTO>[];
  var challengesWithSteps = <ChallengeDTO, List<ChallengeStepDTO>>{};

  for (final filePath in listOfFilesChallenges) {
    final content = await _getFileData(filePath);
    final category =
        content.containsKey('category') ? CategoryDTO.fromJson(content['category'] as Map<String, dynamic>) : null;
    final subcategory = content.containsKey('subcategory')
        ? SubcategoryDTO.fromJson(content['subcategory'] as Map<String, dynamic>)
        : null;

    categories = _updateCategoryList(category, categories);
    subcategories = _updateSubcategoryList(subcategory, subcategories);

    final challenges = (content['challenges'] as List<dynamic>)
        .map((itemDynamic) => ChallengeDTO.fromJson(itemDynamic as Map<String, dynamic>));
    final steps = (content['challenge_steps'] as List<dynamic>)
        .map((itemDynamic) => ChallengeStepDTO.fromJson(itemDynamic as Map<String, dynamic>));

    for (final challenge in challenges) {
      final challengeSteps = steps.where((step) => step.challengeId == challenge.id).toList();
      challengesWithSteps[challenge] = challengeSteps;
    }
  }

  categories = await _createCategories(
    categories: categories,
    database: database,
    collectionId: categoryCollection,
  );

  subcategories = await _createSubcategories(
    database: database,
    collectionId: subcategoryCollection,
    subcategories: subcategories,
  );

  challengesWithSteps = await _createChallenges(
    database: database,
    challengeCollectionId: challengeCollection,
    challengeStepCollectionId: stepCollection,
    challenges: challengesWithSteps,
  );
}

/// generate id: ID.unique()
Future<List<CategoryDTO>> _createCategories({
  required Databases database,
  required String collectionId,
  required List<CategoryDTO> categories,
}) async {
  final updatedCategories = <CategoryDTO>[];

  for (final category in categories) {
    try {
      final response = await database.listDocuments(
        collectionId: collectionId,
        databaseId: databaseId,
        queries: [Query.equal('slug', category.slug)],
      );

      final document = response.documents.firstOrNull;

      if (document != null) {
        print('ANDRII existing category');
        final categoryFromAppWrite = CategoryDTO.fromAppWriteJson(document.data);
        updatedCategories.add(categoryFromAppWrite);
      } else {
        print('ANDRII ${category.slug} does not exist!');
        await database.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: category.id,
          data: category.toDataBaseJson(),
        );
        updatedCategories.add(category);
        print('✅ Category "${category.id}" created.');
      }
    } catch (e) {
      print('ANDRII: e $e');
    }
  }

  categories.forEach((item) {
    print('ANDRII ${item.slug} - ${item.id}');
  });

  return categories;
}

Future<List<SubcategoryDTO>> _createSubcategories({
  required Databases database,
  required String collectionId,
  required List<SubcategoryDTO> subcategories,
}) async {
  final updatedSubcategories = <SubcategoryDTO>[];

  for (final subcategory in subcategories) {
    try {
      final response = await database.listDocuments(
        collectionId: collectionId,
        databaseId: databaseId,
        queries: [Query.equal('slug', subcategory.slug)],
      );

      final document = response.documents.firstOrNull;

      if (document != null) {
        print('ANDRII existing category');
        final subcategoryFromAppWrite = SubcategoryDTO.fromAppWriteJson(document.data);
        updatedSubcategories.add(subcategoryFromAppWrite);
      } else {
        print('ANDRII ${subcategory.slug} does not exist!');
        await database.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: subcategory.id,
          data: subcategory.toDataBaseJson(),
        );
        updatedSubcategories.add(subcategory);
        print('✅ Subcategory "${subcategory.id}" created.');
      }
    } catch (e) {
      print('ANDRII: e $e');
    }
  }

  subcategories.forEach((item) {
    print('ANDRII ${item.slug} - ${item.id}');
  });

  return subcategories;
}

Future<Map<ChallengeDTO, List<ChallengeStepDTO>>> _createChallenges({
  required Databases database,
  required String challengeCollectionId,
  required String challengeStepCollectionId,
  required Map<ChallengeDTO, List<ChallengeStepDTO>> challenges,
}) async {
  final updatedChallenges = <ChallengeDTO, List<ChallengeStepDTO>>{};

  for (final entry in challenges.entries) {
    final challenge = entry.key;
    final challengeSteps = entry.value;

    try {
      final createdChallenge = await _createSingleChallenge(
        database: database,
        collectionId: challengeCollectionId,
        challenge: challenge,
      );

      final createdChallengeSteps = await _createChallengeSteps(
        database: database,
        collectionId: challengeStepCollectionId,
        challenge: createdChallenge,
        steps: challengeSteps,
      );

      updatedChallenges[createdChallenge] = createdChallengeSteps;
    } catch (e) {
      print('ANDRII: e $e');
    }
  }

  return updatedChallenges;
}

Future<ChallengeDTO> _createSingleChallenge({
  required Databases database,
  required String collectionId,
  required ChallengeDTO challenge,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('id', challenge.id)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      print('ANDRII existing Challenge - ${challenge.id}');
      return ChallengeDTO.fromAppWriteJson(document.data);
    } else {
      print('ANDRII ${challenge.id} does not exist!');
      await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: challenge.id,
        data: challenge.toDataBaseJson(),
      );
      print('✅ Challenge "${challenge.id}" created.');
      return challenge;
    }
  } catch (e) {
    print('ANDRII: _createSingleChallenge ${challenge.id} error $e');
    rethrow;
  }
}

Future<List<ChallengeStepDTO>> _createChallengeSteps({
  required Databases database,
  required String collectionId,
  required ChallengeDTO challenge,
  required List<ChallengeStepDTO> steps,
}) async {
  final updatedSteps = <ChallengeStepDTO>[];

  for (final stepBeforeUpdate in steps) {
    try {
      final response = await database.listDocuments(
        collectionId: collectionId,
        databaseId: databaseId,
        queries: [Query.equal('challenge_id', stepBeforeUpdate.challengeId)],
      );

      final document = response.documents
          .firstWhereOrNull((item) => (item.data['step_number'] as int) == stepBeforeUpdate.stepNumber);

      if (document != null) {
        print('ANDRII existing step');
        final stepFromAppWrite = ChallengeStepDTO.fromAppWriteJson(document.data);
        updatedSteps.add(stepFromAppWrite);
      } else {
        final step = stepBeforeUpdate.copyWith(
          id: ID.unique(),
          challengeId: challenge.id,
        );

        print('ANDRII ${step.stepNumber} does not exist!');
        await database.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: step.id,
          data: step.toDataBaseJson(),
        );
        updatedSteps.add(step);
        print('✅ Step "${step.stepNumber}" created.');
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

List<CategoryDTO> _updateCategoryList(CategoryDTO? category, List<CategoryDTO> categories) {
  if (category != null) {
    final hasCategory = categories.any((item) => item.slug == category.slug);

    if (!hasCategory) {
      return [...categories, category];
    } else {
      return categories;
    }
  }

  return categories;
}

List<SubcategoryDTO> _updateSubcategoryList(SubcategoryDTO? subcategory, List<SubcategoryDTO> subcategories) {
  if (subcategory != null) {
    final hasSubcategory = subcategories.any((item) => item.slug == subcategory.slug);

    if (!hasSubcategory) {
      return [...subcategories, subcategory];
    } else {
      return subcategories;
    }
  }

  return subcategories;
}

Future<Map<ChallengeDTO, List<ChallengeStepDTO>>> parseChallenges() async {
  final listOfFilesChallenges = [
    'assets/content/challanges/challanges_without_subcategory.json',
    'assets/content/challanges/communication_challenges.json',
    'assets/content/challanges/conflicts_and_quarrels_challenges.json',
    'assets/content/challanges/daily_life_routine_challenges.json',
    'assets/content/challanges/distance_and_coldness_challenges_v2.json',
    'assets/content/challanges/reconnection_after_breakup_challenges.json',
    'assets/content/challanges/sexual_closeness_advanced_challenges_final.json',
    'assets/content/challanges/sexual_closeness_by_subcategory.json',
    'assets/content/challanges/multy_days/multi_day_arousal_game_3_days.json',
    'assets/content/challanges/multy_days/multi_day_boundless_fantasies.json',
    'assets/content/challanges/multy_days/multi_day_everyday_intimacy.json',
    'assets/content/challanges/multy_days/multi_day_five_nights_of_desire_tips_translated.json',
    'assets/content/challanges/multy_days/multi_day_game_of_desire.json',
    'assets/content/challanges/multy_days/multi_day_roleplay_another_me.json',
    'assets/content/challanges/multy_days/multi_day_safe_intimacy_restart.json',
  ];

  var challengesWithSteps = <ChallengeDTO, List<ChallengeStepDTO>>{};

  for (final filePath in listOfFilesChallenges) {
    final content = await _getFileData(filePath);

    final challenges = (content['challenges'] as List<dynamic>)
        .map((itemDynamic) => ChallengeDTO.fromJson(itemDynamic as Map<String, dynamic>));
    final steps = (content['challenge_steps'] as List<dynamic>)
        .map((itemDynamic) => ChallengeStepDTO.fromJson(itemDynamic as Map<String, dynamic>));

    for (final challenge in challenges) {
      final challengeSteps = steps.where((step) => step.challengeId == challenge.id).toList();
      challengesWithSteps[challenge] = challengeSteps;
    }
  }

  return challengesWithSteps;
}
