import 'package:flutter/material.dart';

import 'core/routes/main_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: AppThemes.light(),
      // darkTheme: AppThemes.dark(),
      // themeMode: ThemeMode.light,
      routerConfig: MainRoutes.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
