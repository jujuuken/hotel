import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static final String baseUrl = dotenv.get('API_URL');
  static const String login = '';
  static const String register = '';
  static const String forgotPassword = '';
}
