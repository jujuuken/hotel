import '../../../features/authentication/data/data_source/local/auth_local_data_source.dart';
import '../../../features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import '../../../features/authentication/data/repository/auth_repository_impl.dart';
import '../../../features/authentication/domain/repository/auth_repository.dart';
import '../../../features/authentication/domain/use_case/login_use_case.dart';
import '../../../features/authentication/domain/use_case/logout_use_case.dart';
import '../../../features/authentication/domain/use_case/register_use_case.dart';
import '../../../features/authentication/presentation/authentication_screen/logic/authentication_bloc.dart';
import '../../api/api_request_helpers/api_consumer.dart';
import '../injection_container.dart';

class AuthModule {
  static void init() {
    sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(api: sl<ApiConsumer>()));
    sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());

    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(rds: sl<AuthRemoteDataSource>(), lds: sl<AuthLocalDataSource>()));

    sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
    sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
    sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));

    sl.registerFactory(
      () => AuthenticationBloc(
        login: sl<LoginUseCase>(),
        register: sl<RegisterUseCase>(),
        logout: sl<LogoutUseCase>(),
      ),
    );
  }
}
