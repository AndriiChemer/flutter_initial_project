import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/widget/deep_links/cubit/deep_links_wrapper_action.dart';
import 'package:iteo_libraries_example/presentation/widget/deep_links/cubit/deep_links_wrapper_cubit.dart';

class DeepLinksWrapper extends HookWidget {
  const DeepLinksWrapper({
    required this.appRouter,
    required this.child,
    super.key,
  });

  final AppRouter appRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<DeepLinksWrapperCubit>();

    useEffect(
      () {
        cubit.startListening();
      },
      [child],
    );

    useActionListener<DeepLinksWrapperAction>(
      cubit,
      _listenForActions,
    );

    return child;
  }

  void _listenForActions(DeepLinksWrapperAction action) {
    switch (action) {
      case DeepLinksWrapperActionRedirectToPage(:final path):
        try {
          appRouter.pushNamed(path);
        } catch (e, _) {
          // TODO add logger
          // Logger.e('Could not navigate to $path', ex: e, stacktrace: s);
        }
    }
  }
}
