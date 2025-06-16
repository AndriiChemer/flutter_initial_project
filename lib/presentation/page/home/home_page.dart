import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/app_write/parsing%20and%20writing/appwrite_daily_content.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton.fullWidth(
        title: 'Run',
        // action: readAll,
        // action: writeToDataBaseTests,
        // action: writeToDataBaseTechnique,
        // action: writeToDataBaseDailyTasks,
        // action: writeToDataBaseDailyPhrase,
        // action: writeToDataBaseChallenges,
        // action: writeToDataBaseCourses,
        action: writeToDataBaseDailyContents,
      ),
    );
    // return const CanvasSplittingImage(
    //   imageUrl: 'https://miro.medium.com/v2/resize:fit:1400/1*U4gZLnRtHEeJuc6tdVLwPw.png',
    // );
  }
}
