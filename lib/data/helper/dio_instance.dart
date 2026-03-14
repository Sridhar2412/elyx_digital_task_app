import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'error_interceptor.dart';
import 'log_interceptor.dart';

part 'dio_instance.g.dart';

@Riverpod(keepAlive: true)
Dio dioInstance(Ref ref) {
  return DioInstance.instance;
}

class DioInstance with DioMixin implements Dio {
  static Dio get instance => DioInstance();

  DioInstance({this.baseUrl}) {
    final options = BaseOptions(
      baseUrl: baseUrl ?? 'https://api.github.com',
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );
    this.options = options;
    httpClientAdapter = IOHttpClientAdapter();
    _setUpInterceptor();
  }

  final String? baseUrl;

  Future<void> _setUpInterceptor() async {
    interceptors.add(LogInterceptorsWrapper());
    interceptors.add(ErrorInterceptorsWrapper());
  }
}
