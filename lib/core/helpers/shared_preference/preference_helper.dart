import 'package:shared_preferences/shared_preferences.dart';

sealed class SharedPrefsHelper {
  static late final SharedPreferences _pref;

  static Future<void> init([SharedPreferences? pref]) async {
    _pref = pref ?? await SharedPreferences.getInstance();
  }

  // OLD save without encryption
  static Future<bool> save(String key, dynamic value) async {
    if (value == null) return false;
    if (value is String) {
      return await _pref.setString(key, value);
    } else if (value is int) {
      return await _pref.setInt(key, value);
    } else if (value is bool) {
      return await _pref.setBool(key, value);
    } else if (value is double) {
      return await _pref.setDouble(key, value);
    } else if (value is List<String>) {
      return await _pref.setStringList(key, value);
    } else {
      throw UnsupportedError('Type not supported for SharedPreferences');
    }
  }

  static dynamic get(String key) {
    return _pref.get(key);
  }

  static Future<bool> remove(String key) async {
    return await _pref.remove(key);
  }

  static Future<bool> clear() async {
    return await _pref.clear();
  }
}
