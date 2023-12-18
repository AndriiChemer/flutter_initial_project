import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/presentation/page/main/cubit/main_page_cubit.dart';

@RoutePage()
class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<MainPageCubit>();
    final state = useBlocBuilder(cubit);

    print('ANDRII state: $state');

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Spacer(),
            state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              idle: (savedAppThemeType) => Column(
                children: AppThemeType.values.map((item) => RadioButton(
                  appThemeType: item,
                  selectedAppThemeType: savedAppThemeType,
                  action: cubit.setAppThemeType,
                )).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.appThemeType,
    required this.selectedAppThemeType,
    required this.action,
    super.key,
  });

  final AppThemeType selectedAppThemeType;
  final AppThemeType appThemeType;
  final Function(AppThemeType? appThemeType) action;

  @override
  Widget build(BuildContext context) {
    print('ANDRII appThemeType: $appThemeType');
    return ListTile(
      title: Text(appThemeType.name),
      leading: Radio<AppThemeType>(
        value: appThemeType,

        groupValue: selectedAppThemeType,
        onChanged: action,
      ),
    );
  }
}
