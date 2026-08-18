import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../../../core/helpers/architecture_helper/use_case.dart';
import '../entity/auth_user.dart';
import '../repository/auth_repository.dart';
import 'auth_param.dart';

class RegisterUseCase extends UseCase<AuthUser, AuthParam> {
  final AuthRepository repo;

  RegisterUseCase(this.repo);

  @override
  TaskEither<Failure, AuthUser> call(AuthParam params) {
    return repo.register(params);
  }
}
