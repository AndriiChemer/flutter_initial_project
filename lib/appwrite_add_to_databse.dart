import 'dart:convert';

// import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/category/category_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_step_dto.dart';

Future<Map<String, dynamic>> _getFileData(String path) async {
  final String jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString) as Map<String, dynamic>;
}

Future<void> writeToDataBase() async {
  // final databases = _getDataBase();
  //
  // const databaseId = '[YOUR_DATABASE_ID]';
  // const categoryCollection = '[challenges_collection_id]';
  // const challengeCollection = '[challenges_collection_id]';
  // const stepCollection = '[challenge_steps_collection_id]';

  // final content = await _getFileData('assets/content/challanges/challanges_without_subcategory.json');
  final content = await _getFileData('assets/content/challanges/communication_challenges.json');

  final category = CategoryDTO.fromJson(content['category'] as Map<String, dynamic>);
  final challenges = (content['challenges'] as List<dynamic>)
      .map((itemDynamic) => ChallengeDTO.fromJson(itemDynamic as Map<String, dynamic>));
  final steps = (content['challenge_steps'] as List<dynamic>)
      .map((itemDynamic) => ChallengeStepDTO.fromJson(itemDynamic as Map<String, dynamic>));

  final challengesWithSteps = <ChallengeDTO, List<ChallengeStepDTO>>{};

  for (final challenge in challenges) {
    final challengeSteps = steps.where((step) => step.challengeId == challenge.id).toList();
    challengesWithSteps[challenge] = challengeSteps;
  }

  print('ANDRII category: ${category.toString()} ===\n\n');
  challengesWithSteps.forEach((key, value) {
    print('ANDRII ${key.title.languages.entries.first.value} - ${value.length}');
  });

  // try {
  //   final existing = await databases.getDocument(
  //     databaseId: databaseId,
  //     collectionId: challengeCollection,
  //     documentId: challenge['id'],
  //   );
  //   print('❗ Challenge "${challenge['id']}" already exists. Skipped.');
  // } catch (e) {
  //   await databases.createDocument(
  //     databaseId: databaseId,
  //     collectionId: challengeCollection,
  //     documentId: challenge['id'],
  //     data: challenge,
  //   );
  //   print('✅ Challenge "${challenge['id']}" created.');
  // }

  // Створення кроків
  // for (var step in steps) {
  //   try {
  //     final existingStep = await databases.getDocument(
  //       databaseId: databaseId,
  //       collectionId: stepCollection,
  //       documentId: step['id'],
  //     );
  //     print('❗ Step "${step['id']}" already exists. Skipped.');
  //   } catch (e) {
  //     await databases.createDocument(
  //       databaseId: databaseId,
  //       collectionId: stepCollection,
  //       documentId: step['id'],
  //       data: step,
  //     );
  //     print('✅ Step "${step['id']}" created.');
  //   }
  // }
}
