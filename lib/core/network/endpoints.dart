import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static final String baseUrl = dotenv.get('API_URL');
  static const String login = '/auth/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String refreshToken = '/refresh-token';
}
