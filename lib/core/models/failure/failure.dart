import '../../failures/error_handler.dart';
import '../../helpers/logger/app_logger.dart';

part 'local_failure.dart';

part 'mapping_failure.dart';

part 'server_failure.dart';

abstract class Failure implements Exception {
  final String message;
  final int? statusCode;
  final Object? error;

  const Failure({required this.message, this.statusCode, this.error});
}
