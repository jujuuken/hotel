import 'package:dio/dio.dart';
import '../helpers/secure_storage/secure_storage_helper.dart';
import '../helpers/secure_storage/secure_storage_keys.dart';
import '../network/api_consumer.dart';
import '../network/endpoints.dart';

class RefreshTokenInterceptor extends Interceptor {
  final ApiConsumer apiConsumer;
  bool _isRefreshing = false;

  // Menggunakan list untuk menampung request yang gagal saat proses refresh berlangsung
  final List<Map<String, dynamic>> _retryQueue = [];

  RefreshTokenInterceptor(this.apiConsumer);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;

    // Pastikan bukan error dari endpoint auth itu sendiri untuk menghindari infinite loop
    final authEndpoints = [
      Endpoints.login,
      Endpoints.register,
      Endpoints.forgotPassword,
      Endpoints.refreshToken,
    ];

    bool isAuthPath = authEndpoints.any(
      (path) => err.requestOptions.path.contains(path),
    );

    if (response?.statusCode == 401 && !isAuthPath) {
      if (!_isRefreshing) {
        _isRefreshing = true;

        final isRefreshSuccess = await _refreshToken();
        _isRefreshing = false;

        if (isRefreshSuccess) {
          // Ambil token baru
          final newToken = await SecureStorageHelper.get(
            StorageKeys.accessToken,
          );

          // Jalankan request awal yang memicu error 401
          _retryRequest(err.requestOptions, handler, newToken);

          // Jalankan semua request lain yang mengantre
          for (var retry in _retryQueue) {
            _retryRequest(retry['options'], retry['handler'], newToken);
          }
          _retryQueue.clear();
          return; // Selesai
        } else {
          // Jika refresh gagal, bersihkan antrean dan teruskan error
          for (var retry in _retryQueue) {
            retry['handler'].reject(err);
          }
          _retryQueue.clear();
          return handler.next(err);
        }
      } else {
        // Jika sedang proses refresh, masukkan ke antrean
        _retryQueue.add({'options': err.requestOptions, 'handler': handler});
        return;
      }
    }
    return handler.next(err);
  }

  // Helper untuk melakukan request ulang dengan token baru
  void _retryRequest(
    RequestOptions options,
    ErrorInterceptorHandler handler,
    String? token,
  ) async {
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await apiConsumer.client.fetch(options);
      handler.resolve(response);
    } catch (e) {
      if (e is DioException) {
        handler.reject(e);
      }
    }
  }

  Future<bool> _refreshToken() async {
    try {
      /// LOGIC SAVE TOKEN

      // final oldRefreshToken = await SecureStorageHelper.get(StorageKeys.refreshToken);
      // if (oldRefreshToken == null || oldRefreshToken.isEmpty) return false;
      //
      // final response = await apiConsumer.post(
      //   "EndPoints.refreshToken",
      //   body: {'refreshToken': oldRefreshToken},
      // );

      // final dynamic data = response.data;
      // final Map<String, dynamic> jsonData = (data is Map && data.containsKey('data'))
      //     ? data['data']
      //     : data;

      // final loginResponse = LoginResponseModel.fromJson(jsonData);
      //
      // await SecureStorageHelper.save(StorageKeys.accessToken, loginResponse.accessToken);
      // if (loginResponse.refreshToken.isNotEmpty) {
      //   await SecureStorageHelper.save(StorageKeys.refreshToken, loginResponse.refreshToken);
      // }
      return true;
    } catch (e) {
      return false;
    }
  }
}
