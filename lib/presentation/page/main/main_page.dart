import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/page/main/cubit/main_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/hook/use_snackbar_controller.dart';

@RoutePage()
class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<MainPageCubit>();
    final state = useBlocBuilder(cubit);
    final snackbarController = useSnackbarController();

    return SnackbarWrapper(
      snackbarController: snackbarController,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
          actions: [
            IconButton(
              onPressed: () => context.router.push(const SettingsRoute()),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Center(),
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
