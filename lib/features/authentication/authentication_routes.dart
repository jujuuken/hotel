import 'package:go_router/go_router.dart';

import '../../shared_utils/extensions/extensions.dart';
import '../splash/presentation/pages/splash_screen.dart';
import 'presentation/authentication_screen/ui/login_screen.dart';
import 'presentation/authentication_screen/ui/register_screen.dart';

class AuthenticationRoutes {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String register = 'register';
  static List<GoRoute> routes = [
    GoRoute(
      path: splash.toPath,
      name: splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: login.toPath,
      name: login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: register.toPath,
      name: register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ];
}
