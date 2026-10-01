import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/authentication_routes.dart';
import '../../shared_utils/extensions/extensions.dart';

class MainRoutes {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AuthenticationRoutes.login.toPath,
    debugLogDiagnostics: true,
    routes: [
      // TabRoutes.route,
      ...AuthenticationRoutes.routes,
    ],

    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page Not Found')),
    ),
  );
}
