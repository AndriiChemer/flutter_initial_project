import 'package:bloc_test/bloc_test.dart';
import 'package:cached_annotation/cached_annotation.dart';
import 'package:flutter_test/flutter_test.dart' as test;
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:meta/meta.dart';

@isTest
void actionBlocTest<B extends BlocActionMixin<Action, State>,
    State extends Object, Action>(
  String description, {
  required B Function() build,
  FutureOr<void> Function()? setUp,
  State Function()? seed,
  void Function(B bloc)? act,
  Duration? wait,
  int skip = 0,
  int skipActions = 0,
  dynamic Function()? expect,
  dynamic Function()? expectActions,
  FutureOr<void> Function(B bloc)? verify,
  dynamic Function()? errors,
  FutureOr<void> Function()? tearDown,
  dynamic tags,
}) {
  late final StreamSubscription<Action> actionsSubscription;
  final actions = <Action>[];

  blocTest<B, State>(
    description,
    setUp: setUp,
    build: () {
      final bloc = build();
      actionsSubscription = bloc.actions.skip(skipActions).listen((action) {
        actions.add(action);
      });

      return bloc;
    },
    seed: seed,
    act: act,
    wait: wait,
    skip: skip,
    expect: expect,
    verify: (bloc) async {
      await actionsSubscription.cancel();
      await verify?.call(bloc);

      if (expectActions != null) {
        test.expect(actions, expectActions());
      }
    },
    errors: errors,
    tearDown: tearDown,
    tags: tags,
  );
}
