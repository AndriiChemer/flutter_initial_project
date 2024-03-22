import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/cars/widget/car_item.dart';
import 'package:iteo_libraries_example/presentation/widget/buttons/export.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_gap.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_text.dart';

@RoutePage()
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
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
            break;
        }
      },
    );

    useEffect(() {
      cubit.getCars();
    }, [cubit],);

    return Center(
      child: switch(state) {
        LoadingCars() => const CircularProgressIndicator(),
        ShowCars() => _Content(
          cubit: cubit,
          cars: state.cars,
        ),
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.cubit,
    required this.cars,
  });

  final CarsCubit cubit;
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: cubit.getCars,
      child: Column(
        children: [
          CustomText.f20w600(LocaleKeys.cars_page_description.tr()),
          const CustomGap.xxxsm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                title: 'Get from isolate',
                action: cubit.getCarsFromIsolate,
              ),
              CustomButton(
                title: 'Get from isolate executor',
                action: cubit.getCarsFromIsolateExecutor,
              ),
            ],
          ),
          const CustomGap.xxxsm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                title: 'Load from isolate',
                action: cubit.loadCardsFromIsolate,
              ),
              CustomButton(
                title: 'Load from isolate executor',
                action: cubit.loadCardsFromIsolateExecutor,
              ),
            ],
          ),
          const CustomGap.xxxsm(),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (_, index) => CarItem(
                car: cars[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
