import 'package:dio/dio.dart';

abstract class ApiConsumer {
  late final Dio client;

  Future<Response> get<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  });

  Future<Response> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  });

  Future<Response> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  });

  Future<Response> delete<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  });

  void setDioOptions();
}
