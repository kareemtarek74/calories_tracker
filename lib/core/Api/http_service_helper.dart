import 'dart:developer';

import 'package:calories_tracker/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpServiceHelper {
  static final Dio dio = sl<Dio>();

  static void setupInterceptors() {
    dio.interceptors.add(buildInterceptor());
    dio.interceptors.add(buildPrettyDioLoggerInterceptor());
  }

  static InterceptorsWrapper buildInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        log('${options.method} ${options.uri}');
        handler.next(options);
      },
      onError: (error, handler) {
        log('Error: ${error.response?.statusCode}');
        handler.next(error);
      },
      onResponse: (response, handler) {
        log('Response: ${response.statusCode}');
        handler.next(response);
      },
    );
  }

  static PrettyDioLogger buildPrettyDioLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      maxWidth: 90,
    );
  }
}
