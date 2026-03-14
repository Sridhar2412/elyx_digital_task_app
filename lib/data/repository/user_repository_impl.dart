import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/injector.dart';
import '../../core/exceptions/app_exception.dart';
import '../../core/extension/future.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_repository.dart';
import '../model/user_dto.dart';
import '../source/local/user_local_source.dart';
import '../source/remote/user_remote_source.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteSource _remoteSource;
  final UserLocalSource _localSource;
  UserRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<Either<AppException, List<User>>> getUsers({
    required int page,
    required int perPage,
    bool refresh = false,
  }) async {
    final responseOrError = await _remoteSource
        .getUsers(page: page, perPage: perPage)
        .guardFuture();

    return responseOrError.fold(
      (error) => Left(error),
      (response) async {
        final domainUsers =
            response.whereType<UserDto>().map((dto) => dto.toDomain()).toList();

        // Cache mechanism
        if (refresh || page == 1) {
          await _localSource.cacheUsers(response);
        } else {
          final cachedDto = await _localSource.getCachedUsers();
          cachedDto.addAll(response);
          await _localSource.cacheUsers(cachedDto.take(100).toList());
        }

        return Right(domainUsers);
      },
    );
  }

  @override
  Future<Either<AppException, List<User>>> getCachedUsers() async {
    try {
      final cachedDto = await _localSource.getCachedUsers();
      if (cachedDto.isEmpty) {
        return const Left(AppException(message: 'No cached data available'));
      }
      return Right(cachedDto.map((dto) => dto.toDomain()).toList());
    } catch (e) {
      return Left(AppException(message: 'Failed to access local cache: $e'));
    }
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return locate<UserRepository>();
}
