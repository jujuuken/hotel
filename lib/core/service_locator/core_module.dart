import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/secure_storage/secure_storage_helper.dart';
import '../helpers/shared_preference/preference_helper.dart';
import '../network/api_consumer.dart';
import '../network/dio_consumer.dart';
import 'service_locator.dart';

class CoreModule {
  static Future<void> init() async {
    // --- Core ---
    // Storage
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPreferences);

    const secureStorage = FlutterSecureStorage();
    sl.registerSingleton<FlutterSecureStorage>(secureStorage);

    await SharedPrefsHelper.init(sharedPreferences);
    await SecureStorageHelper.init(secureStorage);

    // ApiConsumer (Dio)
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());
  }
}
