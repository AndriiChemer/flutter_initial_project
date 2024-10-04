import 'package:mockito/mockito.dart';

extension MockitoWhenWithAnswers on PostExpectation {
  void whenWithAnswersCount<T>(List<T> answers) {
    int callCount = 0;

    thenAnswer((_) {
      if (callCount < answers.length) {
        return Future.value(answers[callCount++]);
      } else {
        return Future.value(answers.last);
      }
    });
  }
}
