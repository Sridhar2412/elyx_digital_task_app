import 'package:dartz/dartz.dart';

import '../../core/exceptions/app_exception.dart';
import '../model/user.dart';

abstract class UserRepository {
  Future<Either<AppException, List<User>>> getUsers({
    required int page,
    required int perPage,
    bool refresh = false,
  });

  Future<Either<AppException, List<User>>> getCachedUsers();
}
