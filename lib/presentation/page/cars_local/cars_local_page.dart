import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/widget/car_item.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cubit/car_local_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

const _withBorderCarItem = true;

@RoutePage()
class CarsLocalPage extends HookWidget {
  const CarsLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CarLocalCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener<CarLocalAction>(
      cubit,
      (action) {
        switch(action) {
          case ShowError():
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
        }
      },
    );

    useEffect(() {
      cubit.loadCars();
    }, [cubit],);

    return WrapperButton.top(
      top: 20,
      button: CustomButton(
        key: const Key('remove_cars_database'),
        title: 'Clear local database',
        padding: const EdgeInsets.only(bottom: Spacings.big),
        action: cubit.clearCarsDatabase,
      ),
      child: switch(state) {
        CarsLocalInitial() => const SizedBox.shrink(),
        EmptyCars() => const _Empty(),
        ShowLocalCars() => _Content(cars: state.cars,),
      },
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText.f18w600('Database is empty.'),
    );
  }
}


class _Content extends HookWidget {
  const _Content({
    required this.cars,
  });

  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cars.length,
      itemBuilder: (_, index) => CarItem(
        withBorder: _withBorderCarItem,
        car: cars[index],
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
    );
  }
}

