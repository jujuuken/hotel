import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../models/failure/failure.dart';
import '../models/response/global_response.dart';

mixin ApiHandler {
  TaskEither<Failure, T> result<T>({
    required Future<Response> Function() call,
    required T Function(Map<String, dynamic>) fromJsonT,
    required T defaultValue,
    bool isGlobalResponse = true,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await call();

      if (isGlobalResponse) {
        final globalResponse = GlobalResponse<T>.fromJson(
          response.data,
          fromJsonT: fromJsonT,
        );

        return globalResponse.data ?? defaultValue;
      } else {
        return fromJsonT(response.data as Map<String, dynamic>);
      }
    }, (error, stackTrace) => handleError(error, stackTrace));
  }

  TaskEither<Failure, Unit> unitResult({
    required Future<Response> Function() call,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await call();

      final globalResponse = GlobalResponse.fromJson(response.data);

      if (globalResponse.status == 'gagal') {
        throw ServerFailure(
          error: globalResponse.message ?? 'Operasi gagal dilakukan',
        );
      }

      return unit;
    }, (error, stackTrace) => handleError(error, stackTrace));
  }

  TaskEither<Failure, T> fakeResult<T>({
    required T Function(Map<String, dynamic>) fromJsonT,
    required T defaultValue,
    bool isSuccess = true,
  }) {
    return TaskEither.tryCatch(() async {
      if (isSuccess) {
        return defaultValue;
      } else {
        throw ServerFailure(
          error: 'Operasi gagal dilakukan',
          message: 'Operasi gagal dilakukan',
        );
      }
    }, (error, stackTrace) => handleError(error, stackTrace));
  }

  TaskEither<Failure, Unit> fakeUnitResult({bool isSuccess = true}) {
    return TaskEither.tryCatch(() async {
      if (isSuccess) {
        return unit;
      } else {
        throw ServerFailure(
          error: 'Operasi gagal dilakukan',
          message: 'Operasi gagal dilakukan',
        );
      }
    }, (error, stackTrace) => handleError(error, stackTrace));
  }

  Failure handleError(Object error, StackTrace stackTrace) {
    if (error is Failure) return error;
    return ServerFailure(
      error: error,
      stacktrace: stackTrace,
      message: 'Terjadi kesalahan pada server',
    );
  }
}
