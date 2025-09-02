import 'package:get_it/get_it.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/data/auth/repositories/auth.dart';
import 'package:watch/data/auth/sources/auth/auth_api_service.dart';
import 'package:watch/data/movie/repositories/movie.dart';
import 'package:watch/data/movie/sources/movie_service.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/domain/auth/usecases/is_logger.dart';
import 'package:watch/domain/auth/usecases/signin.dart';
import 'package:watch/domain/auth/usecases/signup.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/domain/movie/usecases/get_trending_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // * ========> Service <======== * //
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());

  // * ========> Repository <======== * //
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // * ========> Use cases <======== * //
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase());

  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}
