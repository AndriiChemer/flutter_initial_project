import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:iteo_libraries_example/app_write/database_config.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_dto.dart';
import 'package:iteo_libraries_example/app_write/dto/challange/challenge_step_dto.dart';

Future<void> updateToDataBaseChallenges() async {
  final database = getDataBase();

  const challengeCollection = 'challenges';
  const stepCollection = 'challenge_steps';

  final listOfFilesChallenges = [
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
    final content = await getFileDataMap(filePath);

    final challenges = (content['challenges'] as List<dynamic>)
        .map((itemDynamic) => ChallengeDTO.fromJson(itemDynamic as Map<String, dynamic>));
    final steps = (content['challenge_steps'] as List<dynamic>)
        .map((itemDynamic) => ChallengeStepDTO.fromJson(itemDynamic as Map<String, dynamic>));

    for (final challenge in challenges) {
      final challengeSteps = steps.where((step) => step.challengeId == challenge.id).toList();
      challengesWithSteps[challenge] = challengeSteps;
    }
  }

  challengesWithSteps = await _updateChallenges(
    database: database,
    challengeCollectionId: challengeCollection,
    challengeStepCollectionId: stepCollection,
    challenges: challengesWithSteps,
  );

  log('========START=========');
  for (final entry in challengesWithSteps.entries) {
    log('${entry.key.id} - steps: ${entry.value.map((item) => item.stepNumber)}');
  }
  log('========FINISH=========');
}

Future<Map<ChallengeDTO, List<ChallengeStepDTO>>> _updateChallenges({
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
      final updatedChallenge = await _updateSingleChallenge(
        database: database,
        collectionId: challengeCollectionId,
        challenge: challenge,
      );

      final createdChallengeSteps = await _createChallengeSteps(
        database: database,
        collectionId: challengeStepCollectionId,
        challenge: updatedChallenge,
        steps: challengeSteps,
      );

      updatedChallenges[updatedChallenge] = createdChallengeSteps;
    } catch (e) {
      print('ANDRII: e $e');
    }
  }

  return updatedChallenges;
}

Future<ChallengeDTO> _updateSingleChallenge({
  required Databases database,
  required String collectionId,
  required ChallengeDTO challenge,
}) async {
  try {
    await database.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: challenge.id,
      data: challenge.toDataBaseJson(),
    );
    print('✅ Challenge "${challenge.id}" updated.');
    return challenge;
  } catch (e) {
    print('ANDRII: _updateSingleChallenge ${challenge.id} error $e');
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
        await database.deleteDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: document.$id,
        );
        print('ANDRII remove existing step');
      }

      final step = stepBeforeUpdate.copyWith(
        id: ID.unique(),
        challengeId: challenge.id,
      );

      await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: step.id,
        data: step.toDataBaseJson(),
      );
      updatedSteps.add(step);
      print('✅ Step "${step.stepNumber}" created.');
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
