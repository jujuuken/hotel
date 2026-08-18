import '../../../../../core/helpers/secure_storage/secure_storage_helper.dart';
import '../../../../../core/helpers/secure_storage/secure_storage_keys.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);

  Future<void> saveRefreshToken(String token);

  Future<void> clearAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    await SecureStorageHelper.save(StorageKeys.accessToken, token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await SecureStorageHelper.save(StorageKeys.refreshToken, token);
  }

  @override
  Future<void> clearAuthData() async {
    await SecureStorageHelper.clear();
  }
}
