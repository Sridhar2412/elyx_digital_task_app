import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state_model.freezed.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState({
    required T data,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
    @Default(false) bool loading,
    @Default(false) bool loadMore,
    @Default('') String error,
    @Default('') String searchQuery,
    @Default(false) bool isOfflineCache,
  }) = _PaginationState;
}
