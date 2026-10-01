import 'package:fpdart/fpdart.dart';

import '../../../../core/helpers/architecture/use_case.dart';
import '../../../../core/models/failure/failure.dart';
import '../repository/auth_repository.dart';
import 'auth_param.dart';

class LogoutUseCase extends UseCase<Unit, AuthParam> {
  final AuthRepository repo;

  LogoutUseCase(this.repo);

  @override
  TaskEither<Failure, Unit> call(AuthParam params) {
    return repo.logout(params);
  }
}
