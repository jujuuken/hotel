import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../entity/auth_user.dart';
import '../use_case/auth_param.dart';

abstract class AuthRepository {
  TaskEither<Failure, AuthUser> login(AuthParam param);

  TaskEither<Failure, AuthUser> register(AuthParam param);

  TaskEither<Failure, Unit> logout(AuthParam param);
}
