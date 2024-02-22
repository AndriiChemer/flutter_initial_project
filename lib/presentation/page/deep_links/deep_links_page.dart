import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DeepLinksPage extends StatelessWidget {
  const DeepLinksPage({
    @pathParam required this.id,
    @pathParam required this.name,
    super.key,
  });

  final int id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$id: $name'),
      ),
    );
  }
}
