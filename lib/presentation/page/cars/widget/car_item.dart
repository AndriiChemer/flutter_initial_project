import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    required this.car,
    this.withBorder = false,
    super.key,
  });

  final Car car;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
        children: [
          CustomText.f12w500('${car.brand} - ${car.model}'),
          CustomText.f12w500('Num: ${car.registration}'),
        ],
      ),
    );
  }
}
