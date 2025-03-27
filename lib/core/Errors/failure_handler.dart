import 'package:calories_tracker/core/Errors/failure.dart';
import 'package:dio/dio.dart';

class FailureHandler {
  Failure handle(dynamic error) {
    if (error is DioException) {
      return ServerFailure.fromDioError(error);
    } else if (error is Failure) {
      return error;
    } else {
      return ServerFailure(error.toString());
    }
  }

  String getHumanReadableMessage(Failure failure) {
    if (failure is ServerFailure) {
      switch (failure.code) {
        case 408:
          return 'Connection timeout. Please try again.';
        case 499:
          return 'Request was cancelled';
        case 503:
          return 'No internet connection';
        case 400:
          return 'Invalid request';
        case 401:
          return 'Unauthorized access';
        case 404:
          return 'Resource not found';
        case 500:
          return 'Internal server error';
        default:
          return failure.message;
      }
    }
    return failure.message;
  }
}
