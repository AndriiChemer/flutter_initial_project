import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/presentation/page/settings/cubit/settings_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SettingsPageCubit>();
    final state = useBlocBuilder(cubit);

    final colors = Theme.of(context).extension<AppTheme>()!;

    useEffect(() {
      return cubit.close;
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(

        child: switch(state) {
          SettingsPageLoading() => Text('Loading'),
          SettingsPageIdle() => _Content(
            cubit: cubit,
            appThemeType: state.savedAppThemeType,
          ),
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.appThemeType,
    required this.cubit,
  });

  final AppThemeType appThemeType;
  final SettingsPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: AppThemeType.values.map((item) => RadioButton(
            appThemeType: item,
            selectedAppThemeType: appThemeType,
            action: cubit.setAppThemeType,
          )).toList(),
        ),
        const Gap(Spacings.xbig),
        Text(
          'Text color from thene extension',
          style: TextStyle(color: colors.text.color),
        ),
      ],
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
    return Column(
      children: [
        Radio<AppThemeType>(
          value: appThemeType,
          groupValue: selectedAppThemeType,
          onChanged: action,
        ),
        const Gap(Spacings.xsm),
        Text(appThemeType.name)
      ],
    );
  }
}
