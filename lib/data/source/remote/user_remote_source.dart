import 'package:dio/dio.dart';
import 'package:elyx_digital_task_app/data/helper/dio_instance.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/user_dto.dart';

part 'user_remote_source.g.dart';

@RestApi()
abstract class UserRemoteSource {
  factory UserRemoteSource(Dio dio, {String baseUrl}) = _UserRemoteSource;

  @GET("/users")
  Future<List<UserDto>> getUsers({
    @Query("page") int? page,
    @Query("per_page") int? perPage,
  });
}

@Riverpod(keepAlive: true)
UserRemoteSource userRemoteSource(UserRemoteSourceRef ref) {
  final dio = ref.watch(dioInstanceProvider);
  return UserRemoteSource(dio);
}
