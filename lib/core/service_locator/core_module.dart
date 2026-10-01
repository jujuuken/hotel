import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_consumer.dart';
import '../network/dio_consumer.dart';
import 'service_locator.dart';

class CoreModule {
  static Future<void> init() async {
    // --- Core ---
    // Storage
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

    // ApiConsumer (Dio)
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());
  }
}
