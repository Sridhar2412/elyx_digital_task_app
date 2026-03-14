import 'package:elyx_digital_task_app/core/exceptions/app_exception.dart';
import 'package:elyx_digital_task_app/data/model/user_dto.dart';
import 'package:elyx_digital_task_app/data/repository/user_repository_impl.dart';
import 'package:elyx_digital_task_app/data/source/local/user_local_source.dart';
import 'package:elyx_digital_task_app/data/source/remote/user_remote_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRef implements Ref {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockRemoteSource implements UserRemoteSource {
  final bool shouldFail;
  MockRemoteSource({this.shouldFail = false});

  @override
  Future<List<UserDto>> getUsers({int? page, int? perPage}) async {
    if (shouldFail) throw const AppException(message: 'Network error');
    return [
      const UserDto(
        id: 1,
        firstName: 'Samay',
        avatarUrl: 'https://avatar.com/1',
      )
    ];
  }
}

class MockLocalSource implements UserLocalSource {
  List<UserDto> cached = [];

  @override
  Future<void> cacheUsers(List<UserDto> users) async {
    cached = users;
  }

  @override
  Future<List<UserDto>> getCachedUsers() async {
    return cached;
  }
}

void main() {
  group('UserRepositoryImpl Tests', () {
    late MockRemoteSource remoteSource;
    late MockLocalSource localSource;
    late UserRepositoryImpl repository;

    setUp(() {
      remoteSource = MockRemoteSource();
      localSource = MockLocalSource();
      repository = UserRepositoryImpl(remoteSource, localSource);
    });

    test('getUsers success returns Right<List<User>> and caches data',
        () async {
      final result =
          await repository.getUsers(page: 1, perPage: 10, refresh: true);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should not be left'),
        (users) {
          expect(users.length, 1);
          expect(users.first.firstName, 'Samay');
        },
      );

      final cached = await localSource.getCachedUsers();
      expect(cached.length, 1);
    });

    test('getCachedUsers returns cached data mapped to Domain', () async {
      await localSource.cacheUsers(
          [const UserDto(id: 2, firstName: 'Ramesh', avatarUrl: '')]);

      final result = await repository.getCachedUsers();
      expect(result.isRight(), true);

      result.fold(
        (l) => fail('Should not be left'),
        (users) => expect(users.first.firstName, 'Ramesh'),
      );
    });
  });
}
