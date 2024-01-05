import 'package:freezed_annotation/freezed_annotation.dart';

part 'snackbar_properties.f.freezed.dart';

@freezed
class SnackbarProperties with _$SnackbarProperties {
  const factory SnackbarProperties(
    String message, {
    String? title,
    String? iconPath,
    @Default(Duration(seconds: 5)) Duration visibilityDuration,
    @Default(false) bool closable,
  }) = _SnackbarProperties;
}
