// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState<T> {
  T get data => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<T, UserState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<T, $Res> {
  factory $UserStateCopyWith(
          UserState<T> value, $Res Function(UserState<T>) then) =
      _$UserStateCopyWithImpl<T, $Res, UserState<T>>;
  @useResult
  $Res call({T data, String error, bool loading});
}

/// @nodoc
class _$UserStateCopyWithImpl<T, $Res, $Val extends UserState<T>>
    implements $UserStateCopyWith<T, $Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<T, $Res>
    implements $UserStateCopyWith<T, $Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl<T> value, $Res Function(_$UserStateImpl<T>) then) =
      __$$UserStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data, String error, bool loading});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<T, $Res>
    extends _$UserStateCopyWithImpl<T, $Res, _$UserStateImpl<T>>
    implements _$$UserStateImplCopyWith<T, $Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl<T> _value, $Res Function(_$UserStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = null,
    Object? loading = null,
  }) {
    return _then(_$UserStateImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserStateImpl<T> implements _UserState<T> {
  const _$UserStateImpl(
      {required this.data, this.error = '', this.loading = false});

  @override
  final T data;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'UserState<$T>(data: $data, error: $error, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), error, loading);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<T, _$UserStateImpl<T>> get copyWith =>
      __$$UserStateImplCopyWithImpl<T, _$UserStateImpl<T>>(this, _$identity);
}

abstract class _UserState<T> implements UserState<T> {
  const factory _UserState(
      {required final T data,
      final String error,
      final bool loading}) = _$UserStateImpl<T>;

  @override
  T get data;
  @override
  String get error;
  @override
  bool get loading;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<T, _$UserStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
