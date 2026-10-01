import 'package:dio/dio.dart';

import '../models/failure/failure.dart';

part 'status_code.dart';

part 'response_message.dart';

extension DioErrorExtension on DioException {
  Failure getFailure(StackTrace stacktrace) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          statusCode: StatusCode.connectionTimeout,
          error: ResponseMessage.connectionTimeout,
          stacktrace: stacktrace,
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          statusCode: StatusCode.sendTimeout,
          error: ResponseMessage.sendTimeout,
          stacktrace: stacktrace,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          statusCode: StatusCode.receiveTimeout,
          error: ResponseMessage.receiveTimeout,
          stacktrace: stacktrace,
        );
      case DioExceptionType.badResponse:
        if (response != null && response?.statusCode != null && response?.statusMessage != null) {
          return ServerFailure(
            statusCode: response?.statusCode ?? 0,
            error: response?.data['error'] ?? '',
            message: response?.data['message'] ?? '',
            stacktrace: stacktrace,
          );
        } else {
          return ServerFailure(
            statusCode: StatusCode.badRequest,
            error: ResponseMessage.badRequest,
            stacktrace: stacktrace,
          );
        }
      case DioExceptionType.cancel:
        return ServerFailure(
          statusCode: StatusCode.cancel,
          error: ResponseMessage.cancel,
          stacktrace: stacktrace,
        );
      default:
        return ServerFailure(
          statusCode: StatusCode.kDefault,
          error: ResponseMessage.kDefault,
          stacktrace: stacktrace,
        );
    }
  }
}
