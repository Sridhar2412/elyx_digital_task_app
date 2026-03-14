import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState<T> with _$UserState<T> {
  const factory UserState({
    required T data,
    @Default('') String error,
    @Default(false) bool loading,
  }) = _UserState;
}
