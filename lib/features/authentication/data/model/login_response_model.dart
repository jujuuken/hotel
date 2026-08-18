import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/auth_user.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
sealed class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._();

  const factory LoginResponseModel({
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  AuthUser toEntity() {
    return AuthUser(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  static const empty = LoginResponseModel(
    accessToken: '',
    refreshToken: '',
  );
}
