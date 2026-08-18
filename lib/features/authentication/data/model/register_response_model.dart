import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/auth_user.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

@freezed
sealed class RegisterResponseModel with _$RegisterResponseModel {
  const RegisterResponseModel._();

  const factory RegisterResponseModel({
    required String id,
    required String username,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

  AuthUser toEntity() {
    return AuthUser(
      accessToken: id,
      refreshToken: username,
    );
  }

  static const empty = RegisterResponseModel(
    id: '',
    username: '',
  );
}
