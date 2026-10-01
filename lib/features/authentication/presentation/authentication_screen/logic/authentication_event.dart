part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.loginRequest(LoginParam param) = _LoginRequest;

  const factory AuthenticationEvent.registerRequest(RegisterParam param) = _RegisterRequest;

  const factory AuthenticationEvent.logoutRequest() = _LogoutRequest;

  const factory AuthenticationEvent.cancelRequest() = _CancelRequest;
}
