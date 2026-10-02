import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../failures/error_handler.dart';
import '../helpers/logger/app_logger.dart';
import '../helpers/secure_storage/secure_storage_helper.dart';
import '../helpers/secure_storage/secure_storage_keys.dart';
import '../interceptors/app_logger_interceptor.dart';
import '../interceptors/refresh_token_interceptor.dart';
import 'api_consumer.dart';
import 'endpoints.dart';

class DioConsumer implements ApiConsumer {
  static DioConsumer? _instance;
  final String? baseUrl;

  factory DioConsumer({String? baseUrl}) {
    _instance ??= DioConsumer._internal(Dio(), baseUrl: baseUrl);
    return _instance!;
  }

  DioConsumer._internal(this.client, {this.baseUrl}) {
    if (!kIsWeb) {
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }

    setDioOptions();
    client.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final publicEndpoints = [
            Endpoints.login,
            Endpoints.register,
          ];
          bool isPublic = publicEndpoints.contains(options.path);
          if (!isPublic) {
            final token = await SecureStorageHelper.get(StorageKeys.accessToken);
            if (token != '') {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          return handler.next(options);
        },
      ),
      RefreshTokenInterceptor(this),
    ]);

    if (kDebugMode) {
      client.interceptors.add(
        AppLoggerInterceptor(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseMessage: true,
          ),
        ),
      );
      AppLogger.info('DebugMode: Bearer ${SecureStorageHelper.get(StorageKeys.accessToken)}');
    }
  }

  @override
  void setDioOptions() {
    client.options
      ..baseUrl = baseUrl ?? Endpoints.baseUrl
      ..headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      }
      ..sendTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..connectTimeout = const Duration(seconds: 20);
  }

  @override
  final Dio client;

  @override
  Future<Response> get<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: responseType),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
        options: Options(responseType: responseType),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: responseType),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> delete<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: responseType),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  set client(_) {}
}
