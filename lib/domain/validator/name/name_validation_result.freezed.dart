// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NameValidationResult {
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) valid,
    required TResult Function(String name, int maxChar) tooLong,
    required TResult Function(String name, int minChar) tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? valid,
    TResult? Function(String name, int maxChar)? tooLong,
    TResult? Function(String name, int minChar)? tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? valid,
    TResult Function(String name, int maxChar)? tooLong,
    TResult Function(String name, int minChar)? tooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameValid value) valid,
    required TResult Function(NameTooLong value) tooLong,
    required TResult Function(NameTooShort value) tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NameValid value)? valid,
    TResult? Function(NameTooLong value)? tooLong,
    TResult? Function(NameTooShort value)? tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameValid value)? valid,
    TResult Function(NameTooLong value)? tooLong,
    TResult Function(NameTooShort value)? tooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NameValidationResultCopyWith<NameValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameValidationResultCopyWith<$Res> {
  factory $NameValidationResultCopyWith(NameValidationResult value,
          $Res Function(NameValidationResult) then) =
      _$NameValidationResultCopyWithImpl<$Res, NameValidationResult>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$NameValidationResultCopyWithImpl<$Res,
        $Val extends NameValidationResult>
    implements $NameValidationResultCopyWith<$Res> {
  _$NameValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameValidImplCopyWith<$Res>
    implements $NameValidationResultCopyWith<$Res> {
  factory _$$NameValidImplCopyWith(
          _$NameValidImpl value, $Res Function(_$NameValidImpl) then) =
      __$$NameValidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$NameValidImplCopyWithImpl<$Res>
    extends _$NameValidationResultCopyWithImpl<$Res, _$NameValidImpl>
    implements _$$NameValidImplCopyWith<$Res> {
  __$$NameValidImplCopyWithImpl(
      _$NameValidImpl _value, $Res Function(_$NameValidImpl) _then)
      : super(_value, _then);

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$NameValidImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameValidImpl extends NameValid {
  const _$NameValidImpl({required this.name}) : super._();

  @override
  final String name;

  @override
  String toString() {
    return 'NameValidationResult.valid(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameValidImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameValidImplCopyWith<_$NameValidImpl> get copyWith =>
      __$$NameValidImplCopyWithImpl<_$NameValidImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) valid,
    required TResult Function(String name, int maxChar) tooLong,
    required TResult Function(String name, int minChar) tooShort,
  }) {
    return valid(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? valid,
    TResult? Function(String name, int maxChar)? tooLong,
    TResult? Function(String name, int minChar)? tooShort,
  }) {
    return valid?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? valid,
    TResult Function(String name, int maxChar)? tooLong,
    TResult Function(String name, int minChar)? tooShort,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameValid value) valid,
    required TResult Function(NameTooLong value) tooLong,
    required TResult Function(NameTooShort value) tooShort,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NameValid value)? valid,
    TResult? Function(NameTooLong value)? tooLong,
    TResult? Function(NameTooShort value)? tooShort,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameValid value)? valid,
    TResult Function(NameTooLong value)? tooLong,
    TResult Function(NameTooShort value)? tooShort,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class NameValid extends NameValidationResult {
  const factory NameValid({required final String name}) = _$NameValidImpl;
  const NameValid._() : super._();

  @override
  String get name;

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameValidImplCopyWith<_$NameValidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameTooLongImplCopyWith<$Res>
    implements $NameValidationResultCopyWith<$Res> {
  factory _$$NameTooLongImplCopyWith(
          _$NameTooLongImpl value, $Res Function(_$NameTooLongImpl) then) =
      __$$NameTooLongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int maxChar});
}

/// @nodoc
class __$$NameTooLongImplCopyWithImpl<$Res>
    extends _$NameValidationResultCopyWithImpl<$Res, _$NameTooLongImpl>
    implements _$$NameTooLongImplCopyWith<$Res> {
  __$$NameTooLongImplCopyWithImpl(
      _$NameTooLongImpl _value, $Res Function(_$NameTooLongImpl) _then)
      : super(_value, _then);

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? maxChar = null,
  }) {
    return _then(_$NameTooLongImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxChar: null == maxChar
          ? _value.maxChar
          : maxChar // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NameTooLongImpl extends NameTooLong {
  const _$NameTooLongImpl({required this.name, required this.maxChar})
      : super._();

  @override
  final String name;
  @override
  final int maxChar;

  @override
  String toString() {
    return 'NameValidationResult.tooLong(name: $name, maxChar: $maxChar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameTooLongImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxChar, maxChar) || other.maxChar == maxChar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, maxChar);

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameTooLongImplCopyWith<_$NameTooLongImpl> get copyWith =>
      __$$NameTooLongImplCopyWithImpl<_$NameTooLongImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) valid,
    required TResult Function(String name, int maxChar) tooLong,
    required TResult Function(String name, int minChar) tooShort,
  }) {
    return tooLong(name, maxChar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? valid,
    TResult? Function(String name, int maxChar)? tooLong,
    TResult? Function(String name, int minChar)? tooShort,
  }) {
    return tooLong?.call(name, maxChar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? valid,
    TResult Function(String name, int maxChar)? tooLong,
    TResult Function(String name, int minChar)? tooShort,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(name, maxChar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameValid value) valid,
    required TResult Function(NameTooLong value) tooLong,
    required TResult Function(NameTooShort value) tooShort,
  }) {
    return tooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NameValid value)? valid,
    TResult? Function(NameTooLong value)? tooLong,
    TResult? Function(NameTooShort value)? tooShort,
  }) {
    return tooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameValid value)? valid,
    TResult Function(NameTooLong value)? tooLong,
    TResult Function(NameTooShort value)? tooShort,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(this);
    }
    return orElse();
  }
}

abstract class NameTooLong extends NameValidationResult {
  const factory NameTooLong(
      {required final String name,
      required final int maxChar}) = _$NameTooLongImpl;
  const NameTooLong._() : super._();

  @override
  String get name;
  int get maxChar;

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameTooLongImplCopyWith<_$NameTooLongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameTooShortImplCopyWith<$Res>
    implements $NameValidationResultCopyWith<$Res> {
  factory _$$NameTooShortImplCopyWith(
          _$NameTooShortImpl value, $Res Function(_$NameTooShortImpl) then) =
      __$$NameTooShortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int minChar});
}

/// @nodoc
class __$$NameTooShortImplCopyWithImpl<$Res>
    extends _$NameValidationResultCopyWithImpl<$Res, _$NameTooShortImpl>
    implements _$$NameTooShortImplCopyWith<$Res> {
  __$$NameTooShortImplCopyWithImpl(
      _$NameTooShortImpl _value, $Res Function(_$NameTooShortImpl) _then)
      : super(_value, _then);

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minChar = null,
  }) {
    return _then(_$NameTooShortImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minChar: null == minChar
          ? _value.minChar
          : minChar // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NameTooShortImpl extends NameTooShort {
  const _$NameTooShortImpl({required this.name, required this.minChar})
      : super._();

  @override
  final String name;
  @override
  final int minChar;

  @override
  String toString() {
    return 'NameValidationResult.tooShort(name: $name, minChar: $minChar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameTooShortImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minChar, minChar) || other.minChar == minChar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, minChar);

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameTooShortImplCopyWith<_$NameTooShortImpl> get copyWith =>
      __$$NameTooShortImplCopyWithImpl<_$NameTooShortImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) valid,
    required TResult Function(String name, int maxChar) tooLong,
    required TResult Function(String name, int minChar) tooShort,
  }) {
    return tooShort(name, minChar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? valid,
    TResult? Function(String name, int maxChar)? tooLong,
    TResult? Function(String name, int minChar)? tooShort,
  }) {
    return tooShort?.call(name, minChar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? valid,
    TResult Function(String name, int maxChar)? tooLong,
    TResult Function(String name, int minChar)? tooShort,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(name, minChar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameValid value) valid,
    required TResult Function(NameTooLong value) tooLong,
    required TResult Function(NameTooShort value) tooShort,
  }) {
    return tooShort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NameValid value)? valid,
    TResult? Function(NameTooLong value)? tooLong,
    TResult? Function(NameTooShort value)? tooShort,
  }) {
    return tooShort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameValid value)? valid,
    TResult Function(NameTooLong value)? tooLong,
    TResult Function(NameTooShort value)? tooShort,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(this);
    }
    return orElse();
  }
}

abstract class NameTooShort extends NameValidationResult {
  const factory NameTooShort(
      {required final String name,
      required final int minChar}) = _$NameTooShortImpl;
  const NameTooShort._() : super._();

  @override
  String get name;
  int get minChar;

  /// Create a copy of NameValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameTooShortImplCopyWith<_$NameTooShortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
