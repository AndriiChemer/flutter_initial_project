// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmailValidationResult {
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) valid,
    required TResult Function(String email) tooLong,
    required TResult Function(String email) wrongFormat,
    required TResult Function(String email) notAllowedCharacters,
    required TResult Function(String email) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? valid,
    TResult? Function(String email)? tooLong,
    TResult? Function(String email)? wrongFormat,
    TResult? Function(String email)? notAllowedCharacters,
    TResult? Function(String email)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? valid,
    TResult Function(String email)? tooLong,
    TResult Function(String email)? wrongFormat,
    TResult Function(String email)? notAllowedCharacters,
    TResult Function(String email)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailValid value) valid,
    required TResult Function(EmailTooLong value) tooLong,
    required TResult Function(EmailWrongFormat value) wrongFormat,
    required TResult Function(EmailNotAllowedCharacters value)
        notAllowedCharacters,
    required TResult Function(EmailEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailValid value)? valid,
    TResult? Function(EmailTooLong value)? tooLong,
    TResult? Function(EmailWrongFormat value)? wrongFormat,
    TResult? Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult? Function(EmailEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailValid value)? valid,
    TResult Function(EmailTooLong value)? tooLong,
    TResult Function(EmailWrongFormat value)? wrongFormat,
    TResult Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult Function(EmailEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailValidationResultCopyWith<EmailValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailValidationResultCopyWith<$Res> {
  factory $EmailValidationResultCopyWith(EmailValidationResult value,
          $Res Function(EmailValidationResult) then) =
      _$EmailValidationResultCopyWithImpl<$Res, EmailValidationResult>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailValidationResultCopyWithImpl<$Res,
        $Val extends EmailValidationResult>
    implements $EmailValidationResultCopyWith<$Res> {
  _$EmailValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailValidImplCopyWith<$Res>
    implements $EmailValidationResultCopyWith<$Res> {
  factory _$$EmailValidImplCopyWith(
          _$EmailValidImpl value, $Res Function(_$EmailValidImpl) then) =
      __$$EmailValidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailValidImplCopyWithImpl<$Res>
    extends _$EmailValidationResultCopyWithImpl<$Res, _$EmailValidImpl>
    implements _$$EmailValidImplCopyWith<$Res> {
  __$$EmailValidImplCopyWithImpl(
      _$EmailValidImpl _value, $Res Function(_$EmailValidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailValidImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailValidImpl extends EmailValid {
  const _$EmailValidImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'EmailValidationResult.valid(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailValidImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailValidImplCopyWith<_$EmailValidImpl> get copyWith =>
      __$$EmailValidImplCopyWithImpl<_$EmailValidImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) valid,
    required TResult Function(String email) tooLong,
    required TResult Function(String email) wrongFormat,
    required TResult Function(String email) notAllowedCharacters,
    required TResult Function(String email) empty,
  }) {
    return valid(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? valid,
    TResult? Function(String email)? tooLong,
    TResult? Function(String email)? wrongFormat,
    TResult? Function(String email)? notAllowedCharacters,
    TResult? Function(String email)? empty,
  }) {
    return valid?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? valid,
    TResult Function(String email)? tooLong,
    TResult Function(String email)? wrongFormat,
    TResult Function(String email)? notAllowedCharacters,
    TResult Function(String email)? empty,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailValid value) valid,
    required TResult Function(EmailTooLong value) tooLong,
    required TResult Function(EmailWrongFormat value) wrongFormat,
    required TResult Function(EmailNotAllowedCharacters value)
        notAllowedCharacters,
    required TResult Function(EmailEmpty value) empty,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailValid value)? valid,
    TResult? Function(EmailTooLong value)? tooLong,
    TResult? Function(EmailWrongFormat value)? wrongFormat,
    TResult? Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult? Function(EmailEmpty value)? empty,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailValid value)? valid,
    TResult Function(EmailTooLong value)? tooLong,
    TResult Function(EmailWrongFormat value)? wrongFormat,
    TResult Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult Function(EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class EmailValid extends EmailValidationResult {
  const factory EmailValid({required final String email}) = _$EmailValidImpl;
  const EmailValid._() : super._();

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailValidImplCopyWith<_$EmailValidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailTooLongImplCopyWith<$Res>
    implements $EmailValidationResultCopyWith<$Res> {
  factory _$$EmailTooLongImplCopyWith(
          _$EmailTooLongImpl value, $Res Function(_$EmailTooLongImpl) then) =
      __$$EmailTooLongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailTooLongImplCopyWithImpl<$Res>
    extends _$EmailValidationResultCopyWithImpl<$Res, _$EmailTooLongImpl>
    implements _$$EmailTooLongImplCopyWith<$Res> {
  __$$EmailTooLongImplCopyWithImpl(
      _$EmailTooLongImpl _value, $Res Function(_$EmailTooLongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailTooLongImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailTooLongImpl extends EmailTooLong {
  const _$EmailTooLongImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'EmailValidationResult.tooLong(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailTooLongImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailTooLongImplCopyWith<_$EmailTooLongImpl> get copyWith =>
      __$$EmailTooLongImplCopyWithImpl<_$EmailTooLongImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) valid,
    required TResult Function(String email) tooLong,
    required TResult Function(String email) wrongFormat,
    required TResult Function(String email) notAllowedCharacters,
    required TResult Function(String email) empty,
  }) {
    return tooLong(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? valid,
    TResult? Function(String email)? tooLong,
    TResult? Function(String email)? wrongFormat,
    TResult? Function(String email)? notAllowedCharacters,
    TResult? Function(String email)? empty,
  }) {
    return tooLong?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? valid,
    TResult Function(String email)? tooLong,
    TResult Function(String email)? wrongFormat,
    TResult Function(String email)? notAllowedCharacters,
    TResult Function(String email)? empty,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailValid value) valid,
    required TResult Function(EmailTooLong value) tooLong,
    required TResult Function(EmailWrongFormat value) wrongFormat,
    required TResult Function(EmailNotAllowedCharacters value)
        notAllowedCharacters,
    required TResult Function(EmailEmpty value) empty,
  }) {
    return tooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailValid value)? valid,
    TResult? Function(EmailTooLong value)? tooLong,
    TResult? Function(EmailWrongFormat value)? wrongFormat,
    TResult? Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult? Function(EmailEmpty value)? empty,
  }) {
    return tooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailValid value)? valid,
    TResult Function(EmailTooLong value)? tooLong,
    TResult Function(EmailWrongFormat value)? wrongFormat,
    TResult Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult Function(EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(this);
    }
    return orElse();
  }
}

abstract class EmailTooLong extends EmailValidationResult {
  const factory EmailTooLong({required final String email}) =
      _$EmailTooLongImpl;
  const EmailTooLong._() : super._();

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailTooLongImplCopyWith<_$EmailTooLongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailWrongFormatImplCopyWith<$Res>
    implements $EmailValidationResultCopyWith<$Res> {
  factory _$$EmailWrongFormatImplCopyWith(_$EmailWrongFormatImpl value,
          $Res Function(_$EmailWrongFormatImpl) then) =
      __$$EmailWrongFormatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailWrongFormatImplCopyWithImpl<$Res>
    extends _$EmailValidationResultCopyWithImpl<$Res, _$EmailWrongFormatImpl>
    implements _$$EmailWrongFormatImplCopyWith<$Res> {
  __$$EmailWrongFormatImplCopyWithImpl(_$EmailWrongFormatImpl _value,
      $Res Function(_$EmailWrongFormatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailWrongFormatImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailWrongFormatImpl extends EmailWrongFormat {
  const _$EmailWrongFormatImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'EmailValidationResult.wrongFormat(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailWrongFormatImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailWrongFormatImplCopyWith<_$EmailWrongFormatImpl> get copyWith =>
      __$$EmailWrongFormatImplCopyWithImpl<_$EmailWrongFormatImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) valid,
    required TResult Function(String email) tooLong,
    required TResult Function(String email) wrongFormat,
    required TResult Function(String email) notAllowedCharacters,
    required TResult Function(String email) empty,
  }) {
    return wrongFormat(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? valid,
    TResult? Function(String email)? tooLong,
    TResult? Function(String email)? wrongFormat,
    TResult? Function(String email)? notAllowedCharacters,
    TResult? Function(String email)? empty,
  }) {
    return wrongFormat?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? valid,
    TResult Function(String email)? tooLong,
    TResult Function(String email)? wrongFormat,
    TResult Function(String email)? notAllowedCharacters,
    TResult Function(String email)? empty,
    required TResult orElse(),
  }) {
    if (wrongFormat != null) {
      return wrongFormat(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailValid value) valid,
    required TResult Function(EmailTooLong value) tooLong,
    required TResult Function(EmailWrongFormat value) wrongFormat,
    required TResult Function(EmailNotAllowedCharacters value)
        notAllowedCharacters,
    required TResult Function(EmailEmpty value) empty,
  }) {
    return wrongFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailValid value)? valid,
    TResult? Function(EmailTooLong value)? tooLong,
    TResult? Function(EmailWrongFormat value)? wrongFormat,
    TResult? Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult? Function(EmailEmpty value)? empty,
  }) {
    return wrongFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailValid value)? valid,
    TResult Function(EmailTooLong value)? tooLong,
    TResult Function(EmailWrongFormat value)? wrongFormat,
    TResult Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult Function(EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (wrongFormat != null) {
      return wrongFormat(this);
    }
    return orElse();
  }
}

abstract class EmailWrongFormat extends EmailValidationResult {
  const factory EmailWrongFormat({required final String email}) =
      _$EmailWrongFormatImpl;
  const EmailWrongFormat._() : super._();

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailWrongFormatImplCopyWith<_$EmailWrongFormatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailNotAllowedCharactersImplCopyWith<$Res>
    implements $EmailValidationResultCopyWith<$Res> {
  factory _$$EmailNotAllowedCharactersImplCopyWith(
          _$EmailNotAllowedCharactersImpl value,
          $Res Function(_$EmailNotAllowedCharactersImpl) then) =
      __$$EmailNotAllowedCharactersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailNotAllowedCharactersImplCopyWithImpl<$Res>
    extends _$EmailValidationResultCopyWithImpl<$Res,
        _$EmailNotAllowedCharactersImpl>
    implements _$$EmailNotAllowedCharactersImplCopyWith<$Res> {
  __$$EmailNotAllowedCharactersImplCopyWithImpl(
      _$EmailNotAllowedCharactersImpl _value,
      $Res Function(_$EmailNotAllowedCharactersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailNotAllowedCharactersImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailNotAllowedCharactersImpl extends EmailNotAllowedCharacters {
  const _$EmailNotAllowedCharactersImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'EmailValidationResult.notAllowedCharacters(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailNotAllowedCharactersImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailNotAllowedCharactersImplCopyWith<_$EmailNotAllowedCharactersImpl>
      get copyWith => __$$EmailNotAllowedCharactersImplCopyWithImpl<
          _$EmailNotAllowedCharactersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) valid,
    required TResult Function(String email) tooLong,
    required TResult Function(String email) wrongFormat,
    required TResult Function(String email) notAllowedCharacters,
    required TResult Function(String email) empty,
  }) {
    return notAllowedCharacters(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? valid,
    TResult? Function(String email)? tooLong,
    TResult? Function(String email)? wrongFormat,
    TResult? Function(String email)? notAllowedCharacters,
    TResult? Function(String email)? empty,
  }) {
    return notAllowedCharacters?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? valid,
    TResult Function(String email)? tooLong,
    TResult Function(String email)? wrongFormat,
    TResult Function(String email)? notAllowedCharacters,
    TResult Function(String email)? empty,
    required TResult orElse(),
  }) {
    if (notAllowedCharacters != null) {
      return notAllowedCharacters(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailValid value) valid,
    required TResult Function(EmailTooLong value) tooLong,
    required TResult Function(EmailWrongFormat value) wrongFormat,
    required TResult Function(EmailNotAllowedCharacters value)
        notAllowedCharacters,
    required TResult Function(EmailEmpty value) empty,
  }) {
    return notAllowedCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailValid value)? valid,
    TResult? Function(EmailTooLong value)? tooLong,
    TResult? Function(EmailWrongFormat value)? wrongFormat,
    TResult? Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult? Function(EmailEmpty value)? empty,
  }) {
    return notAllowedCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailValid value)? valid,
    TResult Function(EmailTooLong value)? tooLong,
    TResult Function(EmailWrongFormat value)? wrongFormat,
    TResult Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult Function(EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (notAllowedCharacters != null) {
      return notAllowedCharacters(this);
    }
    return orElse();
  }
}

abstract class EmailNotAllowedCharacters extends EmailValidationResult {
  const factory EmailNotAllowedCharacters({required final String email}) =
      _$EmailNotAllowedCharactersImpl;
  const EmailNotAllowedCharacters._() : super._();

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailNotAllowedCharactersImplCopyWith<_$EmailNotAllowedCharactersImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailEmptyImplCopyWith<$Res>
    implements $EmailValidationResultCopyWith<$Res> {
  factory _$$EmailEmptyImplCopyWith(
          _$EmailEmptyImpl value, $Res Function(_$EmailEmptyImpl) then) =
      __$$EmailEmptyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailEmptyImplCopyWithImpl<$Res>
    extends _$EmailValidationResultCopyWithImpl<$Res, _$EmailEmptyImpl>
    implements _$$EmailEmptyImplCopyWith<$Res> {
  __$$EmailEmptyImplCopyWithImpl(
      _$EmailEmptyImpl _value, $Res Function(_$EmailEmptyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailEmptyImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailEmptyImpl extends EmailEmpty {
  const _$EmailEmptyImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'EmailValidationResult.empty(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailEmptyImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailEmptyImplCopyWith<_$EmailEmptyImpl> get copyWith =>
      __$$EmailEmptyImplCopyWithImpl<_$EmailEmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) valid,
    required TResult Function(String email) tooLong,
    required TResult Function(String email) wrongFormat,
    required TResult Function(String email) notAllowedCharacters,
    required TResult Function(String email) empty,
  }) {
    return empty(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? valid,
    TResult? Function(String email)? tooLong,
    TResult? Function(String email)? wrongFormat,
    TResult? Function(String email)? notAllowedCharacters,
    TResult? Function(String email)? empty,
  }) {
    return empty?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? valid,
    TResult Function(String email)? tooLong,
    TResult Function(String email)? wrongFormat,
    TResult Function(String email)? notAllowedCharacters,
    TResult Function(String email)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailValid value) valid,
    required TResult Function(EmailTooLong value) tooLong,
    required TResult Function(EmailWrongFormat value) wrongFormat,
    required TResult Function(EmailNotAllowedCharacters value)
        notAllowedCharacters,
    required TResult Function(EmailEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailValid value)? valid,
    TResult? Function(EmailTooLong value)? tooLong,
    TResult? Function(EmailWrongFormat value)? wrongFormat,
    TResult? Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult? Function(EmailEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailValid value)? valid,
    TResult Function(EmailTooLong value)? tooLong,
    TResult Function(EmailWrongFormat value)? wrongFormat,
    TResult Function(EmailNotAllowedCharacters value)? notAllowedCharacters,
    TResult Function(EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmailEmpty extends EmailValidationResult {
  const factory EmailEmpty({required final String email}) = _$EmailEmptyImpl;
  const EmailEmpty._() : super._();

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailEmptyImplCopyWith<_$EmailEmptyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
