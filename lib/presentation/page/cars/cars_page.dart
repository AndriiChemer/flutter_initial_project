import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/cars/widget/car_item.dart';

class CarsPage extends HookWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CarsCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener<CarsAction>(
      cubit,
      (action) {
        switch(action) {
          case ShowError():
            break;
        }
      },
    );

    return switch(state) {
      CarsInitial() => const SizedBox.shrink(),
      ShowCars() => _Content(
        cubit: cubit,
        cars: [],
      ),
    };
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.cubit,
    required this.cars,
    super.key,
  });

  final CarsCubit cubit;
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: cubit.refreshCars,
      child: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (_, index) => CarItem(
          car: cars[index],
        ),
      ),
    );
  }
}
