import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/architecture/use_case.dart';
import '../../../../core/models/failure/failure.dart';
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
