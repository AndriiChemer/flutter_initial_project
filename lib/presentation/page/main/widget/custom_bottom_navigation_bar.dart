import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';

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
    return SafeArea(
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900]?.withOpacity(0.7),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...items.mapIndexed((index, bottomNavigationItem) => GestureDetector(
                    onTap: () => onTap(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _SelectedIndicator(visible: selectedIndex == index,),
                        SizedBox(height: 2,),
                        _mapBottomNavigationBarIcon(
                          page: bottomNavigationItem,
                          isSelected: selectedIndex == index,
                        ),
                      ],
                    ),
                  ),).toList(),

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
    required bool isSelected,
  }) {
    final color = isSelected ? Colors.white : Colors.white.withOpacity(0.6);

    switch(page) {
      case BottomNavigationPages.home:
        return Icon(
          Icons.home_outlined,
          color: color,
          size: 30,
        );
      case BottomNavigationPages.userForms:
        return Icon(
          Icons.insert_drive_file_outlined,
          color: color,
          size: 30,
        );
      case BottomNavigationPages.more:
        return Icon(
          Icons.more_horiz_outlined,
          color: color,
          size: 30,
        );
      case BottomNavigationPages.cars:
        return Icon(
          Icons.car_rental_outlined,
          color: color,
          size: 30,
        );
      case BottomNavigationPages.localCars:
        return Icon(
          Icons.car_repair_outlined,
          color: color,
          size: 30,
        );
    }
  }
}

class _SelectedIndicator extends StatelessWidget {
  const _SelectedIndicator({
    required this.visible,
    super.key,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 2,
      width: visible ? 30 : 0,
      decoration: BoxDecoration(
          color: Colors.blue
      ),
    );
    // return visible ? AnimatedContainer(
    //   duration: Duration(milliseconds: 2000),
    //   height: 2,
    //   width: 30,
    //   decoration: BoxDecoration(
    //     color: Colors.blue
    //   ),
    // ) : const SizedBox(height: 2);
  }
}

