import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/presentation/page/settings/cubit/settings_page_cubit.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SettingsPageCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
      return cubit.close;
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(

        child: switch(state) {
          SettingsPageLoading() => Text('Loading'),
          SettingsPageIdle() => Text(state.title),
        },
      ),
      floatingActionButton: state is SettingsPageIdle ? FloatingActionButton(
        onPressed: cubit.increase,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}
