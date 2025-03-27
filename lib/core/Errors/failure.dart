import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  final int? code;
  final dynamic data;

  const Failure(this.message, {this.code, this.data});

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code, super.data});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout', code: 408);
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout', code: 408);
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout', code: 408);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled', code: 499);
      case DioExceptionType.connectionError:
        return const ServerFailure('No internet connection', code: 503);
      default:
        return ServerFailure(
          dioError.message ?? 'Unexpected error occurred',
          data: dioError.error,
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    final message = response?['message'] ??
        response?['error'] ??
        'Unexpected error occurred';

    return ServerFailure(message, code: statusCode, data: response);
  }
}
