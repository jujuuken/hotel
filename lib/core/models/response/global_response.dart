
import '../failure/failure.dart';

class GlobalResponse<T> {
  final String? status;
  final String? message;
  final T? data;

  const GlobalResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GlobalResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? fromJsonT,
  }) {
    try {
      final rawData = json['data'];

      dynamic parsedData;

      if (fromJsonT == null || rawData == null) {
        parsedData = null;
      } else if (rawData is List) {
        parsedData = rawData.map((e) => fromJsonT(e as Map<String, dynamic>)).toList();
      } else {
        parsedData = fromJsonT(rawData as Map<String, dynamic>);
      }

      return GlobalResponse(
        status: json['status'] as String?,
        message: json['message'] as String?,
        data: parsedData as T?,
      );
    } catch (error, stackTrace) {
      throw MappingFailure(error: error, stacktrace: stackTrace);
    }
  }
}
