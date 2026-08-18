import 'package:fpdart/fpdart.dart';

import '../../../../core/api/api_request_helpers/api_handler.dart';
import '../../../../core/error_handling/failures/failure.dart';
import '../../domain/entity/auth_user.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_case/auth_param.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl with ApiHandler implements AuthRepository {
  final AuthRemoteDataSource rds;
  final AuthLocalDataSource lds;

  const AuthRepositoryImpl({required this.rds, required this.lds});

  @override
  TaskEither<Failure, AuthUser> login(AuthParam param) {
    return rds.login(param).flatMap((res) {
      return TaskEither.tryCatch(
        () async {
          await lds.saveToken(res.accessToken);
          await lds.saveRefreshToken(res.refreshToken);

          return res.toEntity();
        },
        (error, stackTrace) => handleError(error, stackTrace),
      );
    });
  }

  @override
  TaskEither<Failure, AuthUser> register(AuthParam param) {
    return rds.register(param).map((res) => res.toEntity());
  }

  @override
  TaskEither<Failure, Unit> logout(AuthParam param) {
    return TaskEither.tryCatch(
      () async {
        await lds.clearAuthData();

        return unit;
      },
      (error, stackTrace) => handleError(error, stackTrace),
    );
  }
}
