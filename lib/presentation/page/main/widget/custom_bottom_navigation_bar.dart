import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class CustomBottomNavigationBar extends HookWidget {
  const CustomBottomNavigationBar({
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final List<BottomNavigationPages> items;
  final int selectedIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    final bottomNavigationTheme =
        Theme.of(context).extension<AppTheme>()!.bottomNavigation;
    return SafeArea(
      child: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.all(Spacings.md),
            padding: const EdgeInsets.all(Spacings.xsm),
            decoration: BoxDecoration(
              color: bottomNavigationTheme.background,
              borderRadius: BorderRadius.circular(Spacings.md),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...items.mapIndexed(
                    (index, bottomNavigationItem) => GestureDetector(
                      key: Key(bottomNavigationItem.name),
                      onTap: () => onTap(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _SelectedIndicator(
                            visible: selectedIndex == index,
                          ),
                          const CustomGap.xxxsm(),
                          _mapBottomNavigationBarIcon(
                            page: bottomNavigationItem,
                            isSelected: selectedIndex == index,
                            bottomNavigationTheme: bottomNavigationTheme,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapBottomNavigationBarIcon({
    required BottomNavigationPages page,
    required BottomNavigation bottomNavigationTheme,
    required bool isSelected,
  }) {
    final color = isSelected
        ? bottomNavigationTheme.activeItemColor
        : bottomNavigationTheme.unselectedItemColor;

    switch (page) {
      case BottomNavigationPages.home:
        return Icon(
          Icons.home_outlined,
          color: color,
          size: Dimens.bottomNavigationIconSize,
        );
      case BottomNavigationPages.userForms:
        return Icon(
          Icons.insert_drive_file_outlined,
          color: color,
          size: Dimens.bottomNavigationIconSize,
        );
      case BottomNavigationPages.more:
        return Icon(
          Icons.more_horiz_outlined,
          color: color,
          size: Dimens.bottomNavigationIconSize,
        );
      case BottomNavigationPages.cars:
        return Icon(
          Icons.car_rental_outlined,
          color: color,
          size: Dimens.bottomNavigationIconSize,
        );
      case BottomNavigationPages.localCars:
        return Icon(
          Icons.car_repair_outlined,
          color: color,
          size: Dimens.bottomNavigationIconSize,
        );
      case BottomNavigationPages.authForm:
        return Icon(
          Icons.login,
          color: color,
          size: Dimens.bottomNavigationIconSize,
        );
    }
  }
}

class _SelectedIndicator extends StatelessWidget {
  const _SelectedIndicator({
    required this.visible,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return context.isFlutterTest
        ? Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            height: Dimens.two,
            width: visible
                ? Dimens.bottomNavigationSelectedIndicatorWidth
                : Dimens.zero,
          )
        : AnimatedContainer(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            duration: AnimationDurations.fast,
            height: Dimens.two,
            width: visible
                ? Dimens.bottomNavigationSelectedIndicatorWidth
                : Dimens.zero,
          );
  }
}
