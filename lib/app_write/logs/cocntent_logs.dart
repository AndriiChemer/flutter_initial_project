import 'dart:developer';

import 'package:iteo_libraries_example/app_write/dto/daily_content/json/daily_content_json_dto.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_challange.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_daily_content.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_daily_phrase.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_daily_task.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_technique.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_tests.dart';

void showNullableTitles(List<DailyContentJsonDTO> dailyContentDTO) {
  final phrasesNulls = dailyContentDTO.map((item) => item.phraseTitle).where((item) => item == null).toList();
  final dailyTasksNulls = dailyContentDTO.map((item) => item.dailyTaskTitle).where((item) => item == null).toList();
  final challengesNulls = dailyContentDTO.map((item) => item.challengeTitle).where((item) => item == null).toList();
  final testsNulls = dailyContentDTO.map((item) => item.testTitle).where((item) => item == null).toList();
  final techniquesNulls = dailyContentDTO.map((item) => item.techniqueTitle).where((item) => item == null).toList();

  log('======SHOW NULLABLE TITLE=======');
  log('phrasesNulls: ${phrasesNulls.length} | dailyTasksNulls: ${dailyTasksNulls.length} | challengesNulls: ${challengesNulls.length} | testsNulls: ${testsNulls.length} | techniquesNulls: ${techniquesNulls.length}');
  log('\n\n');
}

void showDuplicates(String key, List<String> titles) {
  final Map<String, int> counts = {};
  for (final title in titles) {
    counts[title] = (counts[title] ?? 0) + 1;
  }
  final duplicates = counts.entries.where((entry) => entry.value > 1).toList();
  log('====== Duplicates for $key:\n');
  for (final entry in duplicates) {
    log('Value: "${entry.key}"  —  Count: ${entry.value}');
  }
  log('\n\n');
}

Future<void> showLogsFromJson() async {
  final dailyContentsJsons = await parseDailyContentJsonDTO();

  final phrases = dailyContentsJsons.map((item) => item.phraseTitle).nonNulls.toList();
  final dailyTasks = dailyContentsJsons.map((item) => item.dailyTaskTitle).nonNulls.toList();
  final challenges = dailyContentsJsons.map((item) => item.challengeTitle).nonNulls.toList();
  final tests = dailyContentsJsons.map((item) => item.testTitle).nonNulls.toList();
  final techniques = dailyContentsJsons.map((item) => item.techniqueTitle).nonNulls.toList();

  showNullableTitles(dailyContentsJsons);

  showDuplicates('phrases', phrases);
  showDuplicates('dailyTasks', dailyTasks);
  showDuplicates('challenges', challenges);
  showDuplicates('techniques', techniques);
  showDuplicates('tests', tests);

  await uniqueChallenges(challenges);
  await uniqueTests(tests);
  await uniqueTechniques(techniques);
  await uniqueDailyTasks(dailyTasks);
  await uniquePhrases(phrases);
}

Future<void> uniqueChallenges(List<String> titles) async {
  final challengesDTOAll = (await parseChallenges())
      .entries
      .map((entry) => entry.key)
      .map((item) => item.title.languages.entries.last.value)
      .toList();

  final setB = Set<String>.from(titles);
  final uniqueChallenges = challengesDTOAll.where((item) => !setB.contains(item)).toList();

  log('====== UNIQUE Challenges - JSON:\n');
  log('count all: ${challengesDTOAll.length} | count from course: ${titles.length} | Not used: [ $uniqueChallenges ]"\n\n');
}

Future<void> uniqueTests(List<String> titles) async {
  final testsDTOAll = (await parseTests()).map((item) => item.title.languages.entries.last.value);

  final setB = Set<String>.from(titles);
  final uniqueTests = testsDTOAll.where((item) => !setB.contains(item)).toList();

  log('====== UNIQUE tests - JSON:\n');
  log('count all: ${testsDTOAll.length} | count from course: ${titles.length} | Not used: [ $uniqueTests ]"\n\n');
}

Future<void> uniqueTechniques(List<String> titles) async {
  final techniquesDTOAll = (await parseTechniques())
      .entries
      .map((entry) => entry.key)
      .map((item) => item.title.languages.entries.last.value)
      .toList();

  final setB = Set<String>.from(titles);
  final uniqueTechniques = techniquesDTOAll.where((item) => !setB.contains(item)).toList();

  log('====== UNIQUE Techniques - JSON:\n');
  log('count all: ${techniquesDTOAll.length} | count from course: ${titles.length} | Not used: [ $uniqueTechniques ]"\n\n');
}

Future<void> uniqueDailyTasks(List<String> titles) async {
  final tasksDTOAll = (await parseDailyTask()).map((item) => item.title.languages.entries.last.value);

  final setB = Set<String>.from(titles);
  final uniqueTasks = tasksDTOAll.where((item) => !setB.contains(item)).toList();

  log('====== UNIQUE DailyTasks - JSON:\n');
  log('count all: ${tasksDTOAll.length} | count from course: ${titles.length} | Not used: [ $uniqueTasks ]"\n\n');
}

Future<void> uniquePhrases(List<String> titles) async {
  final phraseDTOAll = (await parseDailyPhrase()).map((item) => item.phrase.languages.entries.last.value);

  final setB = Set<String>.from(titles);
  final uniquePhrases = phraseDTOAll.where((item) => !setB.contains(item)).toList();

  log('====== UNIQUE Phrases - JSON:\n');
  log('count all: ${phraseDTOAll.length} | count from course: ${titles.length} | Not used: [ $uniquePhrases ]"\n\n');
}
