// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationState<T> {
  T get data => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get loadMore => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get isOfflineCache => throw _privateConstructorUsedError;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationStateCopyWith<T, PaginationState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T, $Res> {
  factory $PaginationStateCopyWith(
          PaginationState<T> value, $Res Function(PaginationState<T>) then) =
      _$PaginationStateCopyWithImpl<T, $Res, PaginationState<T>>;
  @useResult
  $Res call(
      {T data,
      int pageNumber,
      int pageSize,
      bool loading,
      bool loadMore,
      String error,
      String searchQuery,
      bool isOfflineCache});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T, $Res, $Val extends PaginationState<T>>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? loading = null,
    Object? loadMore = null,
    Object? error = null,
    Object? searchQuery = null,
    Object? isOfflineCache = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadMore: null == loadMore
          ? _value.loadMore
          : loadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineCache: null == isOfflineCache
          ? _value.isOfflineCache
          : isOfflineCache // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationStateImplCopyWith<T, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  factory _$$PaginationStateImplCopyWith(_$PaginationStateImpl<T> value,
          $Res Function(_$PaginationStateImpl<T>) then) =
      __$$PaginationStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T data,
      int pageNumber,
      int pageSize,
      bool loading,
      bool loadMore,
      String error,
      String searchQuery,
      bool isOfflineCache});
}

/// @nodoc
class __$$PaginationStateImplCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$PaginationStateImpl<T>>
    implements _$$PaginationStateImplCopyWith<T, $Res> {
  __$$PaginationStateImplCopyWithImpl(_$PaginationStateImpl<T> _value,
      $Res Function(_$PaginationStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? loading = null,
    Object? loadMore = null,
    Object? error = null,
    Object? searchQuery = null,
    Object? isOfflineCache = null,
  }) {
    return _then(_$PaginationStateImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadMore: null == loadMore
          ? _value.loadMore
          : loadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineCache: null == isOfflineCache
          ? _value.isOfflineCache
          : isOfflineCache // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaginationStateImpl<T> implements _PaginationState<T> {
  const _$PaginationStateImpl(
      {required this.data,
      this.pageNumber = 1,
      this.pageSize = 10,
      this.loading = false,
      this.loadMore = false,
      this.error = '',
      this.searchQuery = '',
      this.isOfflineCache = false});

  @override
  final T data;
  @override
  @JsonKey()
  final int pageNumber;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool loadMore;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool isOfflineCache;

  @override
  String toString() {
    return 'PaginationState<$T>(data: $data, pageNumber: $pageNumber, pageSize: $pageSize, loading: $loading, loadMore: $loadMore, error: $error, searchQuery: $searchQuery, isOfflineCache: $isOfflineCache)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadMore, loadMore) ||
                other.loadMore == loadMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isOfflineCache, isOfflineCache) ||
                other.isOfflineCache == isOfflineCache));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      pageNumber,
      pageSize,
      loading,
      loadMore,
      error,
      searchQuery,
      isOfflineCache);

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationStateImplCopyWith<T, _$PaginationStateImpl<T>> get copyWith =>
      __$$PaginationStateImplCopyWithImpl<T, _$PaginationStateImpl<T>>(
          this, _$identity);
}

abstract class _PaginationState<T> implements PaginationState<T> {
  const factory _PaginationState(
      {required final T data,
      final int pageNumber,
      final int pageSize,
      final bool loading,
      final bool loadMore,
      final String error,
      final String searchQuery,
      final bool isOfflineCache}) = _$PaginationStateImpl<T>;

  @override
  T get data;
  @override
  int get pageNumber;
  @override
  int get pageSize;
  @override
  bool get loading;
  @override
  bool get loadMore;
  @override
  String get error;
  @override
  String get searchQuery;
  @override
  bool get isOfflineCache;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationStateImplCopyWith<T, _$PaginationStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
