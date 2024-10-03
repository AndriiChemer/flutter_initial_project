import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/user/user/user.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validator.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/cubit/user_form_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../test/presentation/page/user_form/user_form_page_golden_test.mocks.dart';
import '../../../test/test_helpers/golden_test_app_wrappers.dart';

class UserFormPageRobot {
  UserFormPageRobot(this.tester);

  final WidgetTester tester;
  late Widget page;

  Future<void> initialize() async {
    final getIt = GetIt.instance;
    final userFormBloc = UserFormBloc(MockUserRepository());

    when(userFormBloc.userRepository.getUser()).thenAnswer((_) => Future<User?>.value(null));

    await getIt.reset();
    getIt.registerFactory<UserFormBloc>(() => userFormBloc);
    getIt.registerFactory<NameInputCubit>(() => NameInputCubit(NameValidator()));
    getIt.registerFactory<SurnameInputCubit>(() => SurnameInputCubit(NameValidator()));
    getIt.registerFactory<EmailInputCubit>(() => EmailInputCubit(EmailValidator()));

    page = testPageGetItWrapper(
      page: const MainPage(),
      getItInstance: getIt,
    );
  }

  Future<void> runPage() async {
    await tester.pumpWidget(page);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToCarsPage() async {
    final findedButton = find.byKey(Key(BottomNavigationPages.userForms.name));
    expect(findedButton, findsOneWidget);

    print('Andrii 1');
    await tester.tap(findedButton);
    print('Andrii 1.1');
    await tester.pumpAndSettle();
    print('Andrii 1.1.1');
  }

  Future<void> fillForms() async {
    final textFields = find.byType(TextField);
    print('Andrii 2');
    expect(textFields.at(0), findsOneWidget);
    expect(textFields.at(1), findsOneWidget);
    expect(textFields.at(2), findsOneWidget);

    await tester.enterText(textFields.at(0), 'Test');
    await tester.enterText(textFields.at(1), 'Surname');
    await tester.enterText(textFields.at(2), 'test@test.com');

    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 2));

    await tester.pumpAndSettle();
  }

  Future<void> fillInvalidEmailForms() async {
    final textFields = find.byType(TextField);

    expect(textFields.at(0), findsOneWidget);
    expect(textFields.at(1), findsOneWidget);
    expect(textFields.at(2), findsOneWidget);

    await tester.enterText(textFields.at(0), 'Test');
    await tester.enterText(textFields.at(1), 'Surname');
    await tester.enterText(textFields.at(2), 'test@');

    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 2));

    await tester.pumpAndSettle();
  }
}
