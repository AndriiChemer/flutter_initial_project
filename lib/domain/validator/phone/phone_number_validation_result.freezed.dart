// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number_validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneNumberValidationResult {
  String get phoneNumber => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) valid,
    required TResult Function(String phoneNumber) tooShort,
    required TResult Function(String phoneNumber) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? valid,
    TResult? Function(String phoneNumber)? tooShort,
    TResult? Function(String phoneNumber)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? valid,
    TResult Function(String phoneNumber)? tooShort,
    TResult Function(String phoneNumber)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberValid value) valid,
    required TResult Function(PhoneNumberTooShort value) tooShort,
    required TResult Function(PhoneNumberEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberValid value)? valid,
    TResult? Function(PhoneNumberTooShort value)? tooShort,
    TResult? Function(PhoneNumberEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberValid value)? valid,
    TResult Function(PhoneNumberTooShort value)? tooShort,
    TResult Function(PhoneNumberEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneNumberValidationResultCopyWith<PhoneNumberValidationResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberValidationResultCopyWith<$Res> {
  factory $PhoneNumberValidationResultCopyWith(
          PhoneNumberValidationResult value,
          $Res Function(PhoneNumberValidationResult) then) =
      _$PhoneNumberValidationResultCopyWithImpl<$Res,
          PhoneNumberValidationResult>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$PhoneNumberValidationResultCopyWithImpl<$Res,
        $Val extends PhoneNumberValidationResult>
    implements $PhoneNumberValidationResultCopyWith<$Res> {
  _$PhoneNumberValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneNumberValidImplCopyWith<$Res>
    implements $PhoneNumberValidationResultCopyWith<$Res> {
  factory _$$PhoneNumberValidImplCopyWith(_$PhoneNumberValidImpl value,
          $Res Function(_$PhoneNumberValidImpl) then) =
      __$$PhoneNumberValidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneNumberValidImplCopyWithImpl<$Res>
    extends _$PhoneNumberValidationResultCopyWithImpl<$Res,
        _$PhoneNumberValidImpl>
    implements _$$PhoneNumberValidImplCopyWith<$Res> {
  __$$PhoneNumberValidImplCopyWithImpl(_$PhoneNumberValidImpl _value,
      $Res Function(_$PhoneNumberValidImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneNumberValidImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberValidImpl extends PhoneNumberValid {
  const _$PhoneNumberValidImpl({required this.phoneNumber}) : super._();

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneNumberValidationResult.valid(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberValidImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberValidImplCopyWith<_$PhoneNumberValidImpl> get copyWith =>
      __$$PhoneNumberValidImplCopyWithImpl<_$PhoneNumberValidImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) valid,
    required TResult Function(String phoneNumber) tooShort,
    required TResult Function(String phoneNumber) empty,
  }) {
    return valid(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? valid,
    TResult? Function(String phoneNumber)? tooShort,
    TResult? Function(String phoneNumber)? empty,
  }) {
    return valid?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? valid,
    TResult Function(String phoneNumber)? tooShort,
    TResult Function(String phoneNumber)? empty,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberValid value) valid,
    required TResult Function(PhoneNumberTooShort value) tooShort,
    required TResult Function(PhoneNumberEmpty value) empty,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberValid value)? valid,
    TResult? Function(PhoneNumberTooShort value)? tooShort,
    TResult? Function(PhoneNumberEmpty value)? empty,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberValid value)? valid,
    TResult Function(PhoneNumberTooShort value)? tooShort,
    TResult Function(PhoneNumberEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberValid extends PhoneNumberValidationResult {
  const factory PhoneNumberValid({required final String phoneNumber}) =
      _$PhoneNumberValidImpl;
  const PhoneNumberValid._() : super._();

  @override
  String get phoneNumber;

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberValidImplCopyWith<_$PhoneNumberValidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneNumberTooShortImplCopyWith<$Res>
    implements $PhoneNumberValidationResultCopyWith<$Res> {
  factory _$$PhoneNumberTooShortImplCopyWith(_$PhoneNumberTooShortImpl value,
          $Res Function(_$PhoneNumberTooShortImpl) then) =
      __$$PhoneNumberTooShortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneNumberTooShortImplCopyWithImpl<$Res>
    extends _$PhoneNumberValidationResultCopyWithImpl<$Res,
        _$PhoneNumberTooShortImpl>
    implements _$$PhoneNumberTooShortImplCopyWith<$Res> {
  __$$PhoneNumberTooShortImplCopyWithImpl(_$PhoneNumberTooShortImpl _value,
      $Res Function(_$PhoneNumberTooShortImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneNumberTooShortImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberTooShortImpl extends PhoneNumberTooShort {
  const _$PhoneNumberTooShortImpl({required this.phoneNumber}) : super._();

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneNumberValidationResult.tooShort(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberTooShortImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberTooShortImplCopyWith<_$PhoneNumberTooShortImpl> get copyWith =>
      __$$PhoneNumberTooShortImplCopyWithImpl<_$PhoneNumberTooShortImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) valid,
    required TResult Function(String phoneNumber) tooShort,
    required TResult Function(String phoneNumber) empty,
  }) {
    return tooShort(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? valid,
    TResult? Function(String phoneNumber)? tooShort,
    TResult? Function(String phoneNumber)? empty,
  }) {
    return tooShort?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? valid,
    TResult Function(String phoneNumber)? tooShort,
    TResult Function(String phoneNumber)? empty,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberValid value) valid,
    required TResult Function(PhoneNumberTooShort value) tooShort,
    required TResult Function(PhoneNumberEmpty value) empty,
  }) {
    return tooShort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberValid value)? valid,
    TResult? Function(PhoneNumberTooShort value)? tooShort,
    TResult? Function(PhoneNumberEmpty value)? empty,
  }) {
    return tooShort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberValid value)? valid,
    TResult Function(PhoneNumberTooShort value)? tooShort,
    TResult Function(PhoneNumberEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberTooShort extends PhoneNumberValidationResult {
  const factory PhoneNumberTooShort({required final String phoneNumber}) =
      _$PhoneNumberTooShortImpl;
  const PhoneNumberTooShort._() : super._();

  @override
  String get phoneNumber;

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberTooShortImplCopyWith<_$PhoneNumberTooShortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneNumberEmptyImplCopyWith<$Res>
    implements $PhoneNumberValidationResultCopyWith<$Res> {
  factory _$$PhoneNumberEmptyImplCopyWith(_$PhoneNumberEmptyImpl value,
          $Res Function(_$PhoneNumberEmptyImpl) then) =
      __$$PhoneNumberEmptyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneNumberEmptyImplCopyWithImpl<$Res>
    extends _$PhoneNumberValidationResultCopyWithImpl<$Res,
        _$PhoneNumberEmptyImpl>
    implements _$$PhoneNumberEmptyImplCopyWith<$Res> {
  __$$PhoneNumberEmptyImplCopyWithImpl(_$PhoneNumberEmptyImpl _value,
      $Res Function(_$PhoneNumberEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneNumberEmptyImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberEmptyImpl extends PhoneNumberEmpty {
  const _$PhoneNumberEmptyImpl({required this.phoneNumber}) : super._();

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneNumberValidationResult.empty(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberEmptyImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberEmptyImplCopyWith<_$PhoneNumberEmptyImpl> get copyWith =>
      __$$PhoneNumberEmptyImplCopyWithImpl<_$PhoneNumberEmptyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) valid,
    required TResult Function(String phoneNumber) tooShort,
    required TResult Function(String phoneNumber) empty,
  }) {
    return empty(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? valid,
    TResult? Function(String phoneNumber)? tooShort,
    TResult? Function(String phoneNumber)? empty,
  }) {
    return empty?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? valid,
    TResult Function(String phoneNumber)? tooShort,
    TResult Function(String phoneNumber)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberValid value) valid,
    required TResult Function(PhoneNumberTooShort value) tooShort,
    required TResult Function(PhoneNumberEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberValid value)? valid,
    TResult? Function(PhoneNumberTooShort value)? tooShort,
    TResult? Function(PhoneNumberEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberValid value)? valid,
    TResult Function(PhoneNumberTooShort value)? tooShort,
    TResult Function(PhoneNumberEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberEmpty extends PhoneNumberValidationResult {
  const factory PhoneNumberEmpty({required final String phoneNumber}) =
      _$PhoneNumberEmptyImpl;
  const PhoneNumberEmpty._() : super._();

  @override
  String get phoneNumber;

  /// Create a copy of PhoneNumberValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberEmptyImplCopyWith<_$PhoneNumberEmptyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
