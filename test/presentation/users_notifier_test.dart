import 'package:dartz/dartz.dart';
import 'package:elyx_digital_task_app/core/exceptions/app_exception.dart';
import 'package:elyx_digital_task_app/data/repository/user_repository_impl.dart';
import 'package:elyx_digital_task_app/domain/model/user.dart';
import 'package:elyx_digital_task_app/domain/repository/user_repository.dart';
import 'package:elyx_digital_task_app/presentation/users/providers/users_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserRepository implements UserRepository {
  final Future<Either<AppException, List<User>>> response;
  final Future<Either<AppException, List<User>>> cacheResponse;

  MockUserRepository({required this.response, required this.cacheResponse});

  @override
  Future<Either<AppException, List<User>>> getUsers({
    required int page,
    required int perPage,
    bool refresh = false,
  }) =>
      response;

  @override
  Future<Either<AppException, List<User>>> getCachedUsers() => cacheResponse;
}

void main() {
  group('UsersNotifier Tests', () {
    test('fetches users successfully and updates state', () async {
      const mockUser = User(
          id: 1,
          email: 'rahul@yopmail.com',
          firstName: 'Rahul',
          lastName: 'Kumar',
          avatar: '');

      final repository = MockUserRepository(
        response: Future.value(const Right([mockUser])),
        cacheResponse:
            Future.value(const Left(AppException(message: 'No cache'))),
      );

      final container = ProviderContainer(
        overrides: [
          userRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);

      final sub = container.listen(usersNotifierProvider, (prev, next) {});
      addTearDown(sub.close);

      await Future.delayed(const Duration(milliseconds: 100));

      final state = container.read(usersNotifierProvider);
      expect(state.loading, false);
      expect(state.error, '');
      expect(state.data.length, 1);
      expect(state.data.first.firstName, 'Rahul');
    });

    test('handles API failure correctly and sets error state', () async {
      final repository = MockUserRepository(
        response:
            Future.value(const Left(AppException(message: 'Network error'))),
        cacheResponse:
            Future.value(const Left(AppException(message: 'No cache'))),
      );

      final container = ProviderContainer(
        overrides: [
          userRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);
      final sub = container.listen(usersNotifierProvider, (prev, next) {});
      addTearDown(sub.close);

      final notifier = container.read(usersNotifierProvider.notifier);

      await notifier.getUsersList(refresh: true);

      final state = container.read(usersNotifierProvider);

      expect(state.loading, false);
      expect(state.error, 'Network error');
      expect(state.data.isEmpty, true);
    });

    test('search query filters users properly', () async {
      final users = [
        const User(
            id: 1,
            email: 'rahul@yopmail.com',
            firstName: 'Rahul',
            lastName: 'Kumar',
            avatar: ''),
        const User(
            id: 2,
            email: 'sachin@yopmail.com',
            firstName: 'Sachin',
            lastName: 'Tendulkar',
            avatar: ''),
      ];

      final repository = MockUserRepository(
        response: Future.value(Right(users)),
        cacheResponse:
            Future.value(const Left(AppException(message: 'No cache'))),
      );

      final container = ProviderContainer(
        overrides: [
          userRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);
      final sub = container.listen(usersNotifierProvider, (prev, next) {});
      addTearDown(sub.close);

      final notifier = container.read(usersNotifierProvider.notifier);

      await notifier.getUsersList(refresh: true);

      notifier.searchCtrl.text = 'Rahul';
      await Future.delayed(const Duration(milliseconds: 600));

      final state = container.read(usersNotifierProvider);
      expect(state.data.length, 1);
      expect(state.data.first.firstName, 'Rahul');
    });
  });
}
