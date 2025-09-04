import 'package:get_it/get_it.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/data/auth/repositories/auth.dart';
import 'package:watch/data/auth/sources/auth/auth_api_service.dart';
import 'package:watch/data/movie/repositories/movie.dart';
import 'package:watch/data/movie/sources/movie_service.dart';
import 'package:watch/data/tv/repositories/tv.dart';
import 'package:watch/data/tv/source/tv_service.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/domain/auth/usecases/is_logger.dart';
import 'package:watch/domain/auth/usecases/signin.dart';
import 'package:watch/domain/auth/usecases/signup.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:watch/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:watch/domain/movie/usecases/get_similar_movies.dart';
import 'package:watch/domain/movie/usecases/get_trailer_movie.dart';
import 'package:watch/domain/movie/usecases/get_trending_movies.dart';
import 'package:watch/domain/movie/usecases/search_movie.dart';
import 'package:watch/domain/tv/repositories/tv.dart';
import 'package:watch/domain/tv/usecases/ger_recommendations_tv.dart';
import 'package:watch/domain/tv/usecases/get_keywords_tv.dart';
import 'package:watch/domain/tv/usecases/get_popular_tv.dart';
import 'package:watch/domain/tv/usecases/get_similar_tv.dart';
import 'package:watch/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // * ========> Service <======== * //
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());

  sl.registerSingleton<TvService>(TvServiceImpl());

  // * ========> Repository <======== * //
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  // * ========> Use cases <======== * //
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase());

  // * ========> Use cases Movie <======== * //
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
    GetNowPlayingMoviesUseCase(),
  );
  sl.registerSingleton<GetTrailerMovieUseCase>(GetTrailerMovieUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(
    GetRecommendationMoviesUseCase(),
  );
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());

  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());

  // * ========> Use cases Tv <======== * //
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetRecommendationsTvUseCase>(
    GetRecommendationsTvUseCase(),
  );
  sl.registerSingleton<GetSimilarTvUseCase>(GetSimilarTvUseCase());

  sl.registerSingleton<GetKeywordsTvUseCase>(GetKeywordsTvUseCase());

  sl.registerSingleton<SearchTvUseCase>(SearchTvUseCase());
}
