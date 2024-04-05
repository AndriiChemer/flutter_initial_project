// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snackbar_properties.f.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SnackbarProperties {
  String get message => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get iconPath => throw _privateConstructorUsedError;
  Duration get visibilityDuration => throw _privateConstructorUsedError;
  bool get closable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SnackbarPropertiesCopyWith<SnackbarProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnackbarPropertiesCopyWith<$Res> {
  factory $SnackbarPropertiesCopyWith(
          SnackbarProperties value, $Res Function(SnackbarProperties) then) =
      _$SnackbarPropertiesCopyWithImpl<$Res, SnackbarProperties>;
  @useResult
  $Res call(
      {String message,
      String? title,
      String? iconPath,
      Duration visibilityDuration,
      bool closable});
}

/// @nodoc
class _$SnackbarPropertiesCopyWithImpl<$Res, $Val extends SnackbarProperties>
    implements $SnackbarPropertiesCopyWith<$Res> {
  _$SnackbarPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? title = freezed,
    Object? iconPath = freezed,
    Object? visibilityDuration = null,
    Object? closable = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityDuration: null == visibilityDuration
          ? _value.visibilityDuration
          : visibilityDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      closable: null == closable
          ? _value.closable
          : closable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnackbarPropertiesImplCopyWith<$Res>
    implements $SnackbarPropertiesCopyWith<$Res> {
  factory _$$SnackbarPropertiesImplCopyWith(_$SnackbarPropertiesImpl value,
          $Res Function(_$SnackbarPropertiesImpl) then) =
      __$$SnackbarPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? title,
      String? iconPath,
      Duration visibilityDuration,
      bool closable});
}

/// @nodoc
class __$$SnackbarPropertiesImplCopyWithImpl<$Res>
    extends _$SnackbarPropertiesCopyWithImpl<$Res, _$SnackbarPropertiesImpl>
    implements _$$SnackbarPropertiesImplCopyWith<$Res> {
  __$$SnackbarPropertiesImplCopyWithImpl(_$SnackbarPropertiesImpl _value,
      $Res Function(_$SnackbarPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? title = freezed,
    Object? iconPath = freezed,
    Object? visibilityDuration = null,
    Object? closable = null,
  }) {
    return _then(_$SnackbarPropertiesImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityDuration: null == visibilityDuration
          ? _value.visibilityDuration
          : visibilityDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      closable: null == closable
          ? _value.closable
          : closable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SnackbarPropertiesImpl implements _SnackbarProperties {
  const _$SnackbarPropertiesImpl(this.message,
      {this.title,
      this.iconPath,
      this.visibilityDuration = const Duration(seconds: 5),
      this.closable = false});

  @override
  final String message;
  @override
  final String? title;
  @override
  final String? iconPath;
  @override
  @JsonKey()
  final Duration visibilityDuration;
  @override
  @JsonKey()
  final bool closable;

  @override
  String toString() {
    return 'SnackbarProperties(message: $message, title: $title, iconPath: $iconPath, visibilityDuration: $visibilityDuration, closable: $closable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnackbarPropertiesImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.visibilityDuration, visibilityDuration) ||
                other.visibilityDuration == visibilityDuration) &&
            (identical(other.closable, closable) ||
                other.closable == closable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, title, iconPath, visibilityDuration, closable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnackbarPropertiesImplCopyWith<_$SnackbarPropertiesImpl> get copyWith =>
      __$$SnackbarPropertiesImplCopyWithImpl<_$SnackbarPropertiesImpl>(
          this, _$identity);
}

abstract class _SnackbarProperties implements SnackbarProperties {
  const factory _SnackbarProperties(final String message,
      {final String? title,
      final String? iconPath,
      final Duration visibilityDuration,
      final bool closable}) = _$SnackbarPropertiesImpl;

  @override
  String get message;
  @override
  String? get title;
  @override
  String? get iconPath;
  @override
  Duration get visibilityDuration;
  @override
  bool get closable;
  @override
  @JsonKey(ignore: true)
  _$$SnackbarPropertiesImplCopyWith<_$SnackbarPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
