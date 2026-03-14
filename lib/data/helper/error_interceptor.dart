import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/exceptions/app_exception.dart';

class ErrorInterceptorsWrapper extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = 'Something went wrong!';
    
    if (err.type == DioExceptionType.connectionTimeout || 
        err.type == DioExceptionType.receiveTimeout) {
      message = 'Connection timed out. Please try again.';
    } else if (err.response?.statusCode == 403) {
      message = 'Access denied or blocked by server. (403)';
    } else if (err.response?.statusCode == 404) {
      message = 'Requested resource not found. (404)';
    } else if (err.response?.statusCode == 500) {
      message = 'Server error. Please try again later. (500)';
    } else if (err.error is SocketException) {
      message = 'No Internet connection. Please check your settings.';
    }

    final error = AppException(message: message);
    
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: error,
      ),
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handler.next(options);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
     handler.next(response);
  }
}
