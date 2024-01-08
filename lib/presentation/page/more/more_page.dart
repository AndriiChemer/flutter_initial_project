import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class MorePage extends HookWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isUiBuildState = useState(false);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => isUiBuildState.value = true);
      return () {
        print('ANDRII close');
      };
    }, ['hello']);
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          bottom: isUiBuildState.value ? 180 : -20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
            tooltip: 'Increment',
            onPressed: (){},
            child: const Icon(Icons.remove, color: Colors.white, size: 28),
          ),
        ),

        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: isUiBuildState.value ? 100 : -20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
            tooltip: 'Increment',
            onPressed: (){},
            child: const Icon(Icons.start, color: Colors.white, size: 28),
          ),
        ),

        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: isUiBuildState.value ? 20 : -20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
            tooltip: 'Increment',
            onPressed: (){},
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }
}
