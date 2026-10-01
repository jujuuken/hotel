import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/architecture/use_case.dart';
import '../../../../core/models/failure/failure.dart';
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
