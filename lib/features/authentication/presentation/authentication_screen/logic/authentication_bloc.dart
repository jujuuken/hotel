import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/use_case/auth_param.dart';
import '../../../domain/use_case/login_use_case.dart';
import '../../../domain/use_case/logout_use_case.dart';
import '../../../domain/use_case/register_use_case.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase login;
  final RegisterUseCase register;
  final LogoutUseCase logout;
  CancelToken? _cancelToken;

  AuthenticationBloc({
    required this.login,
    required this.register,
    required this.logout,
  }) : super(const AuthenticationState.initial()) {
    on<_LoginRequest>(_login, transformer: droppable());
    on<_RegisterRequest>(_register, transformer: droppable());
    on<_LogoutRequest>(_logout, transformer: droppable());
    on<_CancelRequest>(_cancel);
  }

  void _login(_LoginRequest event, Emitter<AuthenticationState> emit) async {
    _cancelToken?.cancel('Request login dibatalkan');
    _cancelToken = CancelToken();

    emit(const AuthenticationState.authenticating());

    final param = AuthParam(login: event.param, cancelToken: _cancelToken);

    final result = await login.call(param).run();
    result.fold(
      (l) {
        if (l.statusCode != -2) {
          emit(AuthenticationState.authFailure(l.message));
        }
      },
      (r) => emit(AuthenticationState.authenticated()),
    );
  }

  void _register(_RegisterRequest event, Emitter<AuthenticationState> emit) async {
    _cancelToken?.cancel('Request register dibatalkan');
    _cancelToken = CancelToken();

    emit(const AuthenticationState.authenticating());

    final param = AuthParam(register: event.param, cancelToken: _cancelToken);

    final result = await register.call(param).run();
    result.fold(
      (l) {
        if (l.statusCode != -2) {
          emit(AuthenticationState.authFailure(l.message));
        }
      },
      (r) => emit(AuthenticationState.authenticated()),
    );
  }

  void _logout(_LogoutRequest event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.loggingOut());
    final result = await logout.call(const AuthParam()).run();
    result.fold(
      (l) => emit(AuthenticationState.logoutFailure(l.message)),
      (r) => emit(AuthenticationState.unauthenticated()),
    );
  }

  void _cancel(_CancelRequest event, Emitter<AuthenticationState> emit) {
    _cancelToken?.cancel('Request dibatalkan');
    _cancelToken = null;
    emit(const AuthenticationState.initial());
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel('Bloc dihentikan');
    return super.close();
  }
}
