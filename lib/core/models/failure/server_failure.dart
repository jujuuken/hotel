part of 'failure.dart';

class ServerFailure<T> extends Failure {
  ServerFailure({
    StackTrace? stacktrace,
    super.error,
    super.message = '',
    super.statusCode,
  }) {
    AppLogger.error(this, stacktrace: stacktrace ?? StackTrace.current);
  }

  ServerFailure.noNetwork({
    StackTrace? stacktrace,
    Object error = 'No network available',
    super.message = '',
    super.statusCode = StatusCode.noInternetConnection,
  }) {
    AppLogger.error(this, stacktrace: stacktrace ?? StackTrace.current);
  }
}
