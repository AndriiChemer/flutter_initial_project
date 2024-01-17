import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    required this.car,
    super.key,
  });

  final Car car;

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
          CustomText.style9('${car.brand} - ${car.model}'),
          CustomText.style9('Num: ${car.registration}'),
        ],
      ),
    );
  }
}
