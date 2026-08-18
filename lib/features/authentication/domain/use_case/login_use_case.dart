import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../../../core/helpers/architecture_helper/use_case.dart';
import '../entity/auth_user.dart';
import '../repository/auth_repository.dart';
import 'auth_param.dart';

class LoginUseCase extends UseCase<AuthUser, AuthParam> {
  final AuthRepository repo;

  LoginUseCase(this.repo);

  @override
  TaskEither<Failure, AuthUser> call(AuthParam params) {
    return repo.login(params);
  }
}
