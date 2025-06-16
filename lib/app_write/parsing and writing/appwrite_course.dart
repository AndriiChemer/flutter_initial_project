import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iteo_libraries_example/app_write/dto/course/%D1%81ourse_dto.dart';

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

Future<void> writeToDataBaseCourses() async {
  final database = _getDataBase();

  const courseCollection = 'course';

  final listOfFilesCourses = [
    'assets/content/course/sexual-closeness.json',
    'assets/content/course/towards_each_other.json',
  ];

  var courses = <CourseDTO>[];

  for (final filePath in listOfFilesCourses) {
    final content = await _getFileData(filePath);
    final course = CourseDTO.fromJson(content);
    courses.add(course);
    log('${course.id} - ${course.categoryId} - name: ${course.name.languages.entries.last}');
  }

  var createdCourses = <CourseDTO>[];
  for (final course in courses) {
    final createdCourse = await _createSingleCourse(
      database: database,
      collectionId: courseCollection,
      course: course,
    );
    createdCourses.add(createdCourse);
  }

  log('ANDRII \n\n=====START=============\n');
  for (final course in createdCourses) {
    log('${course.id} - ${course.categoryId} - name: ${course.name.languages.entries.last}');
  }
  log('ANDRII \n=====FINISH=============\n\n');
}

/// generate id: ID.unique()
Future<CourseDTO> _createSingleCourse({
  required Databases database,
  required String collectionId,
  required CourseDTO course,
}) async {
  try {
    final response = await database.listDocuments(
      collectionId: collectionId,
      databaseId: databaseId,
      queries: [Query.equal('id', course.id)],
    );

    final document = response.documents.firstOrNull;

    if (document != null) {
      print('ANDRII existing course - ${course.id}');
      return CourseDTO.fromAppWriteJson(document.data);
    } else {
      print('ANDRII ${course.id} does not exist!');

      await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: course.id,
        data: course.toDataBaseJson(),
      );
      print('✅ Course "${course.id}" created.');
      return course;
    }
  } catch (e) {
    print('ANDRII: _createSingleCourse ${course.id} | ${course.name.languages.entries.last.value} error $e');
    rethrow;
  }
}
