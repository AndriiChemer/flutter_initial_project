// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_text_input_actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseTextInputActions<Validator> {
  Validator get validator => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Validator validator) finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Validator validator)? finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Validator validator)? finishEditing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputFinishEditingFieldAction<Validator> value)
        finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseTextInputFinishEditingFieldAction<Validator> value)?
        finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseTextInputFinishEditingFieldAction<Validator> value)?
        finishEditing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseTextInputActionsCopyWith<Validator, BaseTextInputActions<Validator>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseTextInputActionsCopyWith<Validator, $Res> {
  factory $BaseTextInputActionsCopyWith(BaseTextInputActions<Validator> value,
          $Res Function(BaseTextInputActions<Validator>) then) =
      _$BaseTextInputActionsCopyWithImpl<Validator, $Res,
          BaseTextInputActions<Validator>>;
  @useResult
  $Res call({Validator validator});
}

/// @nodoc
class _$BaseTextInputActionsCopyWithImpl<Validator, $Res,
        $Val extends BaseTextInputActions<Validator>>
    implements $BaseTextInputActionsCopyWith<Validator, $Res> {
  _$BaseTextInputActionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validator = freezed,
  }) {
    return _then(_value.copyWith(
      validator: freezed == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseTextInputFinishEditingFieldActionImplCopyWith<Validator,
    $Res> implements $BaseTextInputActionsCopyWith<Validator, $Res> {
  factory _$$BaseTextInputFinishEditingFieldActionImplCopyWith(
      _$BaseTextInputFinishEditingFieldActionImpl<Validator> value,
      $Res Function(_$BaseTextInputFinishEditingFieldActionImpl<Validator>)
          then) = __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl<
      Validator, $Res>;
  @override
  @useResult
  $Res call({Validator validator});
}

/// @nodoc
class __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl<Validator, $Res>
    extends _$BaseTextInputActionsCopyWithImpl<Validator, $Res,
        _$BaseTextInputFinishEditingFieldActionImpl<Validator>>
    implements
        _$$BaseTextInputFinishEditingFieldActionImplCopyWith<Validator, $Res> {
  __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl(
      _$BaseTextInputFinishEditingFieldActionImpl<Validator> _value,
      $Res Function(_$BaseTextInputFinishEditingFieldActionImpl<Validator>)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validator = freezed,
  }) {
    return _then(_$BaseTextInputFinishEditingFieldActionImpl<Validator>(
      freezed == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator,
    ));
  }
}

/// @nodoc

class _$BaseTextInputFinishEditingFieldActionImpl<Validator>
    implements BaseTextInputFinishEditingFieldAction<Validator> {
  const _$BaseTextInputFinishEditingFieldActionImpl(this.validator);

  @override
  final Validator validator;

  @override
  String toString() {
    return 'BaseTextInputActions<$Validator>.finishEditing(validator: $validator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseTextInputFinishEditingFieldActionImpl<Validator> &&
            const DeepCollectionEquality().equals(other.validator, validator));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(validator));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseTextInputFinishEditingFieldActionImplCopyWith<Validator,
          _$BaseTextInputFinishEditingFieldActionImpl<Validator>>
      get copyWith => __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl<
              Validator,
              _$BaseTextInputFinishEditingFieldActionImpl<Validator>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Validator validator) finishEditing,
  }) {
    return finishEditing(validator);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Validator validator)? finishEditing,
  }) {
    return finishEditing?.call(validator);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Validator validator)? finishEditing,
    required TResult orElse(),
  }) {
    if (finishEditing != null) {
      return finishEditing(validator);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputFinishEditingFieldAction<Validator> value)
        finishEditing,
  }) {
    return finishEditing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseTextInputFinishEditingFieldAction<Validator> value)?
        finishEditing,
  }) {
    return finishEditing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseTextInputFinishEditingFieldAction<Validator> value)?
        finishEditing,
    required TResult orElse(),
  }) {
    if (finishEditing != null) {
      return finishEditing(this);
    }
    return orElse();
  }
}

abstract class BaseTextInputFinishEditingFieldAction<Validator>
    implements BaseTextInputActions<Validator> {
  const factory BaseTextInputFinishEditingFieldAction(
          final Validator validator) =
      _$BaseTextInputFinishEditingFieldActionImpl<Validator>;

  @override
  Validator get validator;
  @override
  @JsonKey(ignore: true)
  _$$BaseTextInputFinishEditingFieldActionImplCopyWith<Validator,
          _$BaseTextInputFinishEditingFieldActionImpl<Validator>>
      get copyWith => throw _privateConstructorUsedError;
}
