import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/helper/dio_instance.dart';
import '../../data/source/local/user_local_source.dart';
import '../../data/source/remote/user_remote_source.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locate = GetIt.instance;

Future<void> setupInjector() async {
  // External
  final sharedPrefs = await SharedPreferences.getInstance();
  locate.registerSingleton<SharedPreferences>(sharedPrefs);

  // Networking
  locate.registerSingleton<Dio>(DioInstance.instance);

  // Sources
  locate.registerLazySingleton<UserRemoteSource>(
    () => UserRemoteSource(locate<Dio>()),
  );
  locate.registerLazySingleton<UserLocalSource>(
    () => UserLocalSource(locate<SharedPreferences>()),
  );

  // repositories
  locate.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      locate<UserRemoteSource>(),
      locate<UserLocalSource>(),
    ),
  );
}

