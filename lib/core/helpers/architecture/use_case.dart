import 'package:fpdart/fpdart.dart';

import '../../models/failure/failure.dart';

abstract class UseCase<ReturnType, Params> {
  TaskEither<Failure, ReturnType> call(Params params);
}

abstract class StreamUseCase<ReturnType, Params> {
  Stream<Either<Failure, ReturnType>> call(Params params);
}
