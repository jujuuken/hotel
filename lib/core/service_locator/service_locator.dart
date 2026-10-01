import 'package:get_it/get_it.dart';

import '../../features/authentication/authentication_module.dart';
import 'core_module.dart';

// Global Service Locator instance
final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // 1. Core Module (Network, Local Storage, External libs)
  await CoreModule.init();

  // 2. Feature Modules
  AuthModule.init();
}
