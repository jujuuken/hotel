import 'package:flutter_secure_storage/flutter_secure_storage.dart';

sealed class SecureStorageHelper {
  static late final FlutterSecureStorage _storage;

  static Future<void> init([FlutterSecureStorage? storage]) async {
    _storage = storage ?? const FlutterSecureStorage();
  }

  static Future<void> save(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
