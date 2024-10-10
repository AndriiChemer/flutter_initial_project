import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/page/home/canvas_example.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasExample(
      imageUrl: 'https://miro.medium.com/v2/resize:fit:1400/1*U4gZLnRtHEeJuc6tdVLwPw.png',
    );
    // return const Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text('Home'),
    //     ],
    //   ),
    // );
  }
}
