import 'package:flutter/material.dart';

abstract class CustomInputController extends ChangeNotifier {
  final textEditingController = TextEditingController();

  void textChangeListener(void Function() listener) {
    textEditingController.addListener(listener);
  }

  String get text;

  bool get isValid;

  void validate();

  void resetError();

  void didUpdateFocus(bool focused) {
    focused ? resetError() : validate();
  }

  void setInitialValue(String? initialValue) =>
      textEditingController.text = initialValue ?? '';

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
