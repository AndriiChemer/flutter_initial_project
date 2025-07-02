import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/app_write/parsing_and_writing/appwrite_daily_content.dart';
import 'package:iteo_libraries_example/app_write/read/daily_content_read.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          CustomButton.fullWidth(
            title: 'Write',
            // action: readAll,
            // action: writeToDataBaseTests,
            // action: writeToDataBaseTechnique,
            // action: writeToDataBaseDailyTasks,
            // action: writeToDataBaseDailyPhrase,
            // action: writeToDataBaseChallenges,
            // action: writeToDataBaseCourses,
            action: writeToDataBaseDailyContents,
            // action: updateToDataBaseChallenges,
          ),
          CustomButton.fullWidth(
            title: 'Read DailyContents',
            action: readDataBaseDailyContents,
          ),
        ],
      ),
    );
  }
}
