import 'package:fpdart/fpdart.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../../../core/network/api_consumer.dart';
import '../../../../../core/network/api_handler.dart';
import '../../../domain/use_case/auth_param.dart';
import '../../model/login_response_model.dart';
import '../../model/register_response_model.dart';

abstract class AuthRemoteDataSource {
  TaskEither<Failure, LoginResponseModel> login(AuthParam param);

  TaskEither<Failure, RegisterResponseModel> register(AuthParam param);

  TaskEither<Failure, Unit> logout(AuthParam param);
}

class AuthRemoteDataSourceImpl with ApiHandler implements AuthRemoteDataSource {
  final ApiConsumer api;

  const AuthRemoteDataSourceImpl({required this.api});

  @override
  TaskEither<Failure, LoginResponseModel> login(AuthParam param) {
    return result<LoginResponseModel>(
      call: () => api.post(
        '',
        body: {
          'userName': param.login?.email,
          'userPassword': param.login?.password,
        },
        cancelToken: param.cancelToken,
      ),
      fromJsonT: (json) => LoginResponseModel.fromJson(json),
      defaultValue: LoginResponseModel.empty,
    );
  }

  @override
  TaskEither<Failure, RegisterResponseModel> register(AuthParam param) {
    return result<RegisterResponseModel>(
      call: () => api.get('', cancelToken: param.cancelToken),
      fromJsonT: (json) => RegisterResponseModel.fromJson(json),
      defaultValue: RegisterResponseModel.empty,
    );
  }

  @override
  TaskEither<Failure, Unit> logout(AuthParam param) {
    return fakeUnitResult();
  }
}
