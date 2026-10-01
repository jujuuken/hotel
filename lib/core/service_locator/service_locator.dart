import 'package:get_it/get_it.dart';

import 'core_module.dart';

// Global Service Locator instance
final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // 1. Core Module (Network, Local Storage, External libs)
  await CoreModule.init();

  // 2. Feature Modules
  // ProductModule.init();
}
