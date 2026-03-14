import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/utils/debounce.dart';
import '../../../data/repository/user_repository_impl.dart';
import '../../../domain/model/pagination_state_model.dart';
import '../../../domain/model/user.dart';
import '../../../domain/repository/user_repository.dart';

final usersNotifierProvider =
    StateNotifierProvider<UsersNotifier, PaginationState<List<User>>>((ref) {
  return UsersNotifier(ref);
});

class UsersNotifier extends StateNotifier<PaginationState<List<User>>> {
  UsersNotifier(this._ref) : super(const PaginationState(data: <User>[])) {
    init();
  }

  final Ref _ref;
  late UserRepository _repo;
  List<User> _fullData = [];

  final searchCtrl = TextEditingController();
  final debounce = Debounce(millisecond: 500);

  void init() {
    _repo = _ref.read(userRepositoryProvider);
    searchCtrl.addListener(onSearchChanged);
    getUsersList();
  }

  @override
  void dispose() {
    searchCtrl.removeListener(onSearchChanged);
    debounce.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  Future<void> getUsersList({bool refresh = false}) async {
    if (refresh) reset();

    state = state.copyWith(
      loading: true,
      loadMore: false,
    );

    final Either<AppException, List<User>> result;

    result = await _repo.getUsers(
      page: state.pageNumber,
      perPage: state.pageSize,
      refresh: refresh,
    );

    await result.fold((error) async {
      final cacheResult = await _repo.getCachedUsers();
      cacheResult.fold((cacheError) {
        state = state.copyWith(error: error.message, loading: false);
      }, (cachedData) {
        _fullData = cachedData;
        state = state.copyWith(
          data: _getFilteredData(_fullData, state.searchQuery),
          loading: false,
          isOfflineCache: true,
          error: error.message,
        );
      });
    }, (result) async {
      if (refresh) {
        _fullData = result;
      } else {
        _fullData.addAll(result);
      }

      state = state.copyWith(
        data: _getFilteredData(_fullData, state.searchQuery),
        loadMore: result.length >= state.pageSize && state.searchQuery.isEmpty,
        error: '',
        loading: false,
        pageNumber: state.pageNumber + 1,
        isOfflineCache: false,
      );
    });
  }

  void onException(AppException error) {
    state = state.copyWith(error: error.message, loading: false);
  }

  void onSearchChanged() {
    debounce.run(() {
      final query = searchCtrl.text.trim();
      if (state.searchQuery == query) return;

      state = state.copyWith(
        searchQuery: query,
        data: _getFilteredData(_fullData, query),
        loadMore: query.isEmpty &&
            _fullData.length >= (state.pageNumber - 1) * state.pageSize,
      );
    });
  }

  List<User> _getFilteredData(List<User> list, String query) {
    if (query.isEmpty) return list;

    final terms = query.toLowerCase().split(' ').where((t) => t.isNotEmpty);
    if (terms.isEmpty) return list;

    return list.where((user) {
      final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();

      return terms.every((term) => fullName.contains(term));
    }).toList();
  }

  Future<void> loadMore() async {
    if (state.loadMore && !state.loading) {
      await getUsersList();
    }
  }

  void reset() {
    _fullData = [];
    state = state.copyWith(
      data: <User>[],
      pageNumber: 1,
      loading: false,
      loadMore: false,
      error: '',
    );
  }

  void resetError() {
    state = state.copyWith(error: '');
  }
}
