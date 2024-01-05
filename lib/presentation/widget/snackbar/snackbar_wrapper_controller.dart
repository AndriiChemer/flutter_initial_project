part of 'snackbar_wrapper.dart';

typedef InfoListener = void Function(SnackbarProperties properties);
typedef ErrorListener = void Function(SnackbarProperties properties);
typedef CloseListener = void Function();

class SnackbarWrapperController {
  InfoListener? _infoListener;
  ErrorListener? _errorListener;
  CloseListener? _closeListener;

  static SnackbarWrapperController of(BuildContext context) {
    assert(
      context.getElementForInheritedWidgetOfExactType<SnackbarWrapperScope>() !=
          null,
    );

    return context
        .dependOnInheritedWidgetOfExactType<SnackbarWrapperScope>()!
        .snackbarController;
  }

  void showInfo(SnackbarProperties properties) =>
      _infoListener?.call(properties);

  void showError(SnackbarProperties properties) {
    _errorListener?.call(properties);
  }

  void showUnknownError() => showError(
    SnackbarProperties(
      LocaleKeys.snackbar_wrapper_unknown_error_message.tr(),
      title: LocaleKeys.snackbar_wrapper_unknown_error_title.tr(),
    ),
  );

  void close() => _closeListener?.call();

  void dispose() {
    _infoListener = null;
    _errorListener = null;
    _closeListener = null;
  }
}
