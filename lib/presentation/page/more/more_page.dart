import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/page/more/widget/animation_float_button.dart';

@RoutePage()
class MorePage extends HookWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        AnimatedFloatButton(
          duration: Duration(milliseconds: 300),
          bottom: 180,
          title: 'Button 1',
          icon: Icon(Icons.remove),
        ),
        AnimatedFloatButton(
          duration: Duration(milliseconds: 250),
          bottom: 100,
          title: 'Button 2',
          icon: Icon(Icons.start),
        ),
        AnimatedFloatButton(
          duration: Duration(milliseconds: 200),
          bottom: 20,
          title: 'Button 1',
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
