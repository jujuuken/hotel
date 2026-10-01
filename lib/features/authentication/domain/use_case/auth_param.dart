import 'package:dio/dio.dart';

class AuthParam {
  final LoginParam? login;
  final RegisterParam? register;
  final CancelToken? cancelToken;

  const AuthParam({
    this.login,
    this.register,
    this.cancelToken,
  });
}

class LoginParam {
  final String email;
  final String password;

  const LoginParam({
    required this.email,
    required this.password,
  });
}

class RegisterParam {
  final String fullName;
  final String email;
  final String password;
  final bool acceptTerms;

  const RegisterParam({
    required this.fullName,
    required this.email,
    required this.password,
    this.acceptTerms = false, // Pengganti @Default(false)
  });
}