// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_text_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseTextInputActions<TValidatedInput> {
  TValidatedInput get validatedInput => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TValidatedInput validatedInput) finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TValidatedInput validatedInput)? finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TValidatedInput validatedInput)? finishEditing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputFinishEditingFieldAction<TValidatedInput> value)
        finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            BaseTextInputFinishEditingFieldAction<TValidatedInput> value)?
        finishEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            BaseTextInputFinishEditingFieldAction<TValidatedInput> value)?
        finishEditing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BaseTextInputActions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseTextInputActionsCopyWith<TValidatedInput,
          BaseTextInputActions<TValidatedInput>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseTextInputActionsCopyWith<TValidatedInput, $Res> {
  factory $BaseTextInputActionsCopyWith(
          BaseTextInputActions<TValidatedInput> value,
          $Res Function(BaseTextInputActions<TValidatedInput>) then) =
      _$BaseTextInputActionsCopyWithImpl<TValidatedInput, $Res,
          BaseTextInputActions<TValidatedInput>>;
  @useResult
  $Res call({TValidatedInput validatedInput});
}

/// @nodoc
class _$BaseTextInputActionsCopyWithImpl<TValidatedInput, $Res,
        $Val extends BaseTextInputActions<TValidatedInput>>
    implements $BaseTextInputActionsCopyWith<TValidatedInput, $Res> {
  _$BaseTextInputActionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseTextInputActions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedInput = freezed,
  }) {
    return _then(_value.copyWith(
      validatedInput: freezed == validatedInput
          ? _value.validatedInput
          : validatedInput // ignore: cast_nullable_to_non_nullable
              as TValidatedInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseTextInputFinishEditingFieldActionImplCopyWith<
    TValidatedInput,
    $Res> implements $BaseTextInputActionsCopyWith<TValidatedInput, $Res> {
  factory _$$BaseTextInputFinishEditingFieldActionImplCopyWith(
      _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput> value,
      $Res Function(
              _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>)
          then) = __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl<
      TValidatedInput, $Res>;
  @override
  @useResult
  $Res call({TValidatedInput validatedInput});
}

/// @nodoc
class __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl<TValidatedInput,
        $Res>
    extends _$BaseTextInputActionsCopyWithImpl<TValidatedInput, $Res,
        _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>>
    implements
        _$$BaseTextInputFinishEditingFieldActionImplCopyWith<TValidatedInput,
            $Res> {
  __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl(
      _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput> _value,
      $Res Function(
              _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>)
          _then)
      : super(_value, _then);

  /// Create a copy of BaseTextInputActions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedInput = freezed,
  }) {
    return _then(_$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>(
      freezed == validatedInput
          ? _value.validatedInput
          : validatedInput // ignore: cast_nullable_to_non_nullable
              as TValidatedInput,
    ));
  }
}

/// @nodoc

class _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>
    implements BaseTextInputFinishEditingFieldAction<TValidatedInput> {
  const _$BaseTextInputFinishEditingFieldActionImpl(this.validatedInput);

  @override
  final TValidatedInput validatedInput;

  @override
  String toString() {
    return 'BaseTextInputActions<$TValidatedInput>.finishEditing(validatedInput: $validatedInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseTextInputFinishEditingFieldActionImpl<
                TValidatedInput> &&
            const DeepCollectionEquality()
                .equals(other.validatedInput, validatedInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(validatedInput));

  /// Create a copy of BaseTextInputActions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseTextInputFinishEditingFieldActionImplCopyWith<TValidatedInput,
          _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>>
      get copyWith => __$$BaseTextInputFinishEditingFieldActionImplCopyWithImpl<
              TValidatedInput,
              _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TValidatedInput validatedInput) finishEditing,
  }) {
    return finishEditing(validatedInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TValidatedInput validatedInput)? finishEditing,
  }) {
    return finishEditing?.call(validatedInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TValidatedInput validatedInput)? finishEditing,
    required TResult orElse(),
  }) {
    if (finishEditing != null) {
      return finishEditing(validatedInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputFinishEditingFieldAction<TValidatedInput> value)
        finishEditing,
  }) {
    return finishEditing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            BaseTextInputFinishEditingFieldAction<TValidatedInput> value)?
        finishEditing,
  }) {
    return finishEditing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            BaseTextInputFinishEditingFieldAction<TValidatedInput> value)?
        finishEditing,
    required TResult orElse(),
  }) {
    if (finishEditing != null) {
      return finishEditing(this);
    }
    return orElse();
  }
}

abstract class BaseTextInputFinishEditingFieldAction<TValidatedInput>
    implements BaseTextInputActions<TValidatedInput> {
  const factory BaseTextInputFinishEditingFieldAction(
          final TValidatedInput validatedInput) =
      _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>;

  @override
  TValidatedInput get validatedInput;

  /// Create a copy of BaseTextInputActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseTextInputFinishEditingFieldActionImplCopyWith<TValidatedInput,
          _$BaseTextInputFinishEditingFieldActionImpl<TValidatedInput>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BaseTextInputState<TInput, TValidatedInput> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(TValidatedInput validatedInput) validated,
    required TResult Function(TInput input) notValidated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(TValidatedInput validatedInput)? validated,
    TResult? Function(TInput input)? notValidated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(TValidatedInput validatedInput)? validated,
    TResult Function(TInput input)? notValidated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputStateInit<TInput, TValidatedInput> value)
        init,
    required TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)
        validated,
    required TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)
        notValidated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult? Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult? Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseTextInputStateCopyWith<TInput, TValidatedInput, $Res> {
  factory $BaseTextInputStateCopyWith(
          BaseTextInputState<TInput, TValidatedInput> value,
          $Res Function(BaseTextInputState<TInput, TValidatedInput>) then) =
      _$BaseTextInputStateCopyWithImpl<TInput, TValidatedInput, $Res,
          BaseTextInputState<TInput, TValidatedInput>>;
}

/// @nodoc
class _$BaseTextInputStateCopyWithImpl<TInput, TValidatedInput, $Res,
        $Val extends BaseTextInputState<TInput, TValidatedInput>>
    implements $BaseTextInputStateCopyWith<TInput, TValidatedInput, $Res> {
  _$BaseTextInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BaseTextInputStateInitImplCopyWith<TInput, TValidatedInput,
    $Res> {
  factory _$$BaseTextInputStateInitImplCopyWith(
          _$BaseTextInputStateInitImpl<TInput, TValidatedInput> value,
          $Res Function(_$BaseTextInputStateInitImpl<TInput, TValidatedInput>)
              then) =
      __$$BaseTextInputStateInitImplCopyWithImpl<TInput, TValidatedInput, $Res>;
}

/// @nodoc
class __$$BaseTextInputStateInitImplCopyWithImpl<TInput, TValidatedInput, $Res>
    extends _$BaseTextInputStateCopyWithImpl<TInput, TValidatedInput, $Res,
        _$BaseTextInputStateInitImpl<TInput, TValidatedInput>>
    implements
        _$$BaseTextInputStateInitImplCopyWith<TInput, TValidatedInput, $Res> {
  __$$BaseTextInputStateInitImplCopyWithImpl(
      _$BaseTextInputStateInitImpl<TInput, TValidatedInput> _value,
      $Res Function(_$BaseTextInputStateInitImpl<TInput, TValidatedInput>)
          _then)
      : super(_value, _then);

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BaseTextInputStateInitImpl<TInput, TValidatedInput>
    implements BaseTextInputStateInit<TInput, TValidatedInput> {
  const _$BaseTextInputStateInitImpl();

  @override
  String toString() {
    return 'BaseTextInputState<$TInput, $TValidatedInput>.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseTextInputStateInitImpl<TInput, TValidatedInput>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(TValidatedInput validatedInput) validated,
    required TResult Function(TInput input) notValidated,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(TValidatedInput validatedInput)? validated,
    TResult? Function(TInput input)? notValidated,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(TValidatedInput validatedInput)? validated,
    TResult Function(TInput input)? notValidated,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputStateInit<TInput, TValidatedInput> value)
        init,
    required TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)
        validated,
    required TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)
        notValidated,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult? Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult? Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class BaseTextInputStateInit<TInput, TValidatedInput>
    implements BaseTextInputState<TInput, TValidatedInput> {
  const factory BaseTextInputStateInit() =
      _$BaseTextInputStateInitImpl<TInput, TValidatedInput>;
}

/// @nodoc
abstract class _$$BaseTextInputStateValidatedImplCopyWith<TInput,
    TValidatedInput, $Res> {
  factory _$$BaseTextInputStateValidatedImplCopyWith(
      _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput> value,
      $Res Function(_$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>)
          then) = __$$BaseTextInputStateValidatedImplCopyWithImpl<TInput,
      TValidatedInput, $Res>;
  @useResult
  $Res call({TValidatedInput validatedInput});
}

/// @nodoc
class __$$BaseTextInputStateValidatedImplCopyWithImpl<TInput, TValidatedInput,
        $Res>
    extends _$BaseTextInputStateCopyWithImpl<TInput, TValidatedInput, $Res,
        _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>>
    implements
        _$$BaseTextInputStateValidatedImplCopyWith<TInput, TValidatedInput,
            $Res> {
  __$$BaseTextInputStateValidatedImplCopyWithImpl(
      _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput> _value,
      $Res Function(_$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>)
          _then)
      : super(_value, _then);

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validatedInput = freezed,
  }) {
    return _then(_$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>(
      freezed == validatedInput
          ? _value.validatedInput
          : validatedInput // ignore: cast_nullable_to_non_nullable
              as TValidatedInput,
    ));
  }
}

/// @nodoc

class _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>
    implements BaseTextInputStateValidated<TInput, TValidatedInput> {
  const _$BaseTextInputStateValidatedImpl(this.validatedInput);

  @override
  final TValidatedInput validatedInput;

  @override
  String toString() {
    return 'BaseTextInputState<$TInput, $TValidatedInput>.validated(validatedInput: $validatedInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput> &&
            const DeepCollectionEquality()
                .equals(other.validatedInput, validatedInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(validatedInput));

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseTextInputStateValidatedImplCopyWith<TInput, TValidatedInput,
          _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>>
      get copyWith => __$$BaseTextInputStateValidatedImplCopyWithImpl<
              TInput,
              TValidatedInput,
              _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(TValidatedInput validatedInput) validated,
    required TResult Function(TInput input) notValidated,
  }) {
    return validated(validatedInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(TValidatedInput validatedInput)? validated,
    TResult? Function(TInput input)? notValidated,
  }) {
    return validated?.call(validatedInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(TValidatedInput validatedInput)? validated,
    TResult Function(TInput input)? notValidated,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated(validatedInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputStateInit<TInput, TValidatedInput> value)
        init,
    required TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)
        validated,
    required TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)
        notValidated,
  }) {
    return validated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult? Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult? Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
  }) {
    return validated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated(this);
    }
    return orElse();
  }
}

abstract class BaseTextInputStateValidated<TInput, TValidatedInput>
    implements BaseTextInputState<TInput, TValidatedInput> {
  const factory BaseTextInputStateValidated(
          final TValidatedInput validatedInput) =
      _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>;

  TValidatedInput get validatedInput;

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseTextInputStateValidatedImplCopyWith<TInput, TValidatedInput,
          _$BaseTextInputStateValidatedImpl<TInput, TValidatedInput>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseTextInputStateNotValidatedImplCopyWith<TInput,
    TValidatedInput, $Res> {
  factory _$$BaseTextInputStateNotValidatedImplCopyWith(
      _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput> value,
      $Res Function(
              _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>)
          then) = __$$BaseTextInputStateNotValidatedImplCopyWithImpl<TInput,
      TValidatedInput, $Res>;
  @useResult
  $Res call({TInput input});
}

/// @nodoc
class __$$BaseTextInputStateNotValidatedImplCopyWithImpl<TInput,
        TValidatedInput, $Res>
    extends _$BaseTextInputStateCopyWithImpl<TInput, TValidatedInput, $Res,
        _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>>
    implements
        _$$BaseTextInputStateNotValidatedImplCopyWith<TInput, TValidatedInput,
            $Res> {
  __$$BaseTextInputStateNotValidatedImplCopyWithImpl(
      _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput> _value,
      $Res Function(
              _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>)
          _then)
      : super(_value, _then);

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>(
      freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as TInput,
    ));
  }
}

/// @nodoc

class _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>
    implements BaseTextInputStateNotValidated<TInput, TValidatedInput> {
  const _$BaseTextInputStateNotValidatedImpl(this.input);

  @override
  final TInput input;

  @override
  String toString() {
    return 'BaseTextInputState<$TInput, $TValidatedInput>.notValidated(input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseTextInputStateNotValidatedImpl<TInput,
                TValidatedInput> &&
            const DeepCollectionEquality().equals(other.input, input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(input));

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseTextInputStateNotValidatedImplCopyWith<TInput, TValidatedInput,
          _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>>
      get copyWith => __$$BaseTextInputStateNotValidatedImplCopyWithImpl<
              TInput,
              TValidatedInput,
              _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(TValidatedInput validatedInput) validated,
    required TResult Function(TInput input) notValidated,
  }) {
    return notValidated(input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(TValidatedInput validatedInput)? validated,
    TResult? Function(TInput input)? notValidated,
  }) {
    return notValidated?.call(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(TValidatedInput validatedInput)? validated,
    TResult Function(TInput input)? notValidated,
    required TResult orElse(),
  }) {
    if (notValidated != null) {
      return notValidated(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            BaseTextInputStateInit<TInput, TValidatedInput> value)
        init,
    required TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)
        validated,
    required TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)
        notValidated,
  }) {
    return notValidated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult? Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult? Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
  }) {
    return notValidated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseTextInputStateInit<TInput, TValidatedInput> value)?
        init,
    TResult Function(
            BaseTextInputStateValidated<TInput, TValidatedInput> value)?
        validated,
    TResult Function(
            BaseTextInputStateNotValidated<TInput, TValidatedInput> value)?
        notValidated,
    required TResult orElse(),
  }) {
    if (notValidated != null) {
      return notValidated(this);
    }
    return orElse();
  }
}

abstract class BaseTextInputStateNotValidated<TInput, TValidatedInput>
    implements BaseTextInputState<TInput, TValidatedInput> {
  const factory BaseTextInputStateNotValidated(final TInput input) =
      _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>;

  TInput get input;

  /// Create a copy of BaseTextInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseTextInputStateNotValidatedImplCopyWith<TInput, TValidatedInput,
          _$BaseTextInputStateNotValidatedImpl<TInput, TValidatedInput>>
      get copyWith => throw _privateConstructorUsedError;
}
