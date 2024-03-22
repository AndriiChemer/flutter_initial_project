import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/page/settings/cubit/settings_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/snackbar_properties.f.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final snackbarController = useSnackbarController();

    final cubit = useBloc<SettingsPageCubit>();
    final state = useBlocBuilder(
      cubit,
      buildWhen: (state) => [
        SettingsPageIdle,
        SettingsPageLoading,
      ].contains(state.runtimeType,),
    );

    useBlocListener(cubit, (cubit, value, context) => _listener(
      state: value,
      snackbarController: snackbarController,
    ), listenWhen: (state) => [
      SettingsPageShowError,
      SettingsPageShowWarning,
    ].contains(state.runtimeType,),);

    useEffect(() {
      return cubit.close;
    }, [cubit],);

    return SnackbarWrapper(
      snackbarController: snackbarController,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.setting_page_title.tr()),
        ),
        body: Center(
          child: switch(state) {
            SettingsPageLoading() => Text(LocaleKeys.setting_page_loading.tr()),
            SettingsPageIdle() => _Content(
              cubit: cubit,
              appThemeType: state.savedAppThemeType,
            ),
            SettingsPageShowError() => const SizedBox.shrink(),
            SettingsPageShowWarning() => const SizedBox.shrink(),
          },
        ),
      ),
    );
  }

  void _listener({
    required Object? state,
    required SnackbarWrapperController snackbarController,
  }) {
    if(state is SettingsPageShowError) {
      snackbarController.showError(state.properties);
    } else if(state is SettingsPageShowWarning) {
      snackbarController.showInfo(state.properties);
    }
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
          ),).toList(),
        ),
        const CustomGap.xbig(),
        Text(
          LocaleKeys.setting_page_extension_color.tr(),
          style: TextStyle(color: colors.textColorTheme.color),
        ),
        const CustomGap.lg(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              title: LocaleKeys.setting_page_buttons_show_warning.tr(),
              action: () => cubit.showWarning(
                SnackbarProperties(
                  LocaleKeys.setting_page_warning_message.tr(),
                  title: LocaleKeys.setting_page_warning_title.tr(),
                ),
              ),
            ),
            CustomButton(
              title: LocaleKeys.setting_page_buttons_show_error.tr(),
              action: () => cubit.showError(
                SnackbarProperties(
                  LocaleKeys.setting_page_error_message.tr(),
                  title: LocaleKeys.setting_page_error_title.tr(),
                ),
              ),
            ),
          ],
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
  final void Function(AppThemeType? appThemeType) action;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        Radio<AppThemeType>(
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return colors.iconColorTheme.orange.withOpacity(.32);
            }
            return colors.iconColorTheme.orange;
          }),
          value: appThemeType,
          groupValue: selectedAppThemeType,
          onChanged: action,
        ),
        const CustomGap.xsm(),
        CustomText.f15w500(appThemeType.name),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.action,
    super.key,
  });

  final String title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppTheme>()!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.elevateButtonTheme.elevatedBackground,
        elevation: 0,
      ),
      onPressed: action,
      child: Text(
        title,
        style: TextStyle(color: colors.elevateButtonTheme.elevatedText),
      ),
    );
  }
}
