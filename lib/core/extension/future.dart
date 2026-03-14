import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../exceptions/app_exception.dart';

extension FutureEitherExtension<T> on Future<T> {
  Future<Either<AppException, T>> guardFuture() async {
    try {
      final result = await this;
      return Right(result);
    } on DioException catch (e) {
      if (e.error is AppException) {
        return Left(e.error as AppException);
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.error is SocketException) {
        return const Left(AppException(
          message:
              'No internet connection. Please check your network and try again.',
          code: 'network_error',
        ));
      }
      return Left(AppException(
        message: e.message ?? 'An unexpected network error occurred.',
        code: e.response?.statusCode?.toString() ?? 'unknown_dio_error',
        details: e.response?.data,
      ));
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return Left(AppException(
        message: 'An internal error occurred: ${e.toString()}',
        code: 'internal_error',
      ));
    }
  }
}
