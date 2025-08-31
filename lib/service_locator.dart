import 'package:get_it/get_it.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/data/repositories/auth/auth.dart';
import 'package:watch/data/sources/auth/auth_api_service.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/domain/auth/usecases/is_logger.dart';
import 'package:watch/domain/auth/usecases/signin.dart';
import 'package:watch/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // * ========> Service <======== * //
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // * ========> Repository <======== * //
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // * ========> Use cases <======== * //
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase());
}
