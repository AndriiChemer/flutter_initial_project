import 'package:auto_route/auto_route.dart';
import 'package:cached_annotation/cached_annotation.dart';
import 'package:connecteo/connecteo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundState = useState<Color?>(null);
    final connectionTypeState = useState<List<ConnectionType>?>(null);
    final connecteo = useMemoized(() => ConnectionChecker());

    useEffect(() {
      _setupInitialColor(
        connecteo: connecteo,
        callback: (Color background) => backgroundState.value = background,
      );
      _setupConnectionListener(
        connecteo: connecteo,
        callback: (Color background) => backgroundState.value = background,
      );
      _registerConnectionBackCallback(connecteo);
    }, [connecteo]);

    return backgroundState.value != null
        ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () async {
              final types = await connecteo.connectionTypes;
              connectionTypeState.value = types;
            },
            child: const Text('Check connection type'),
          ),
          Text('Connection type value: ${connectionTypeState.value}'),
        ],
      ),
    )
        : const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _setupConnectionListener({
    required ConnectionChecker connecteo,
    required void Function(Color background) callback,
  }) {
    connecteo.connectionStream.listen((isConnected) => _updateBackgroundColor(
      isConnected: isConnected,
      callback: callback,
    ),);
  }

  void _setupInitialColor({
    required ConnectionChecker connecteo,
    required void Function(Color background) callback,
  }) {
    connecteo.isConnected.then((isConnected) => _updateBackgroundColor(
      isConnected: isConnected,
      callback: callback,
    ),);
  }

  void _updateBackgroundColor({
    required bool isConnected,
    required void Function(Color background) callback,
  }) {
    callback(isConnected ? Colors.green[100]! : Colors.red[100]!);
  }

  void _registerConnectionBackCallback(ConnectionChecker connecteo) {
    Future<void>.delayed(const Duration(seconds: 5)).then((_) async {
      final isConnected = await connecteo.isConnected;

      if (!isConnected) {
        // Register callback to be triggered once connection back
        await connecteo
            .untilConnects()
        // ignore: avoid_print
            .then((_) => print('Connection is back!'));
      }
    });
  }
}
