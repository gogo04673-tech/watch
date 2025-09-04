import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<String, dynamic>> getTrendingMovies();

  Future<Either<String, dynamic>> getNowPlayingMovies();

  Future<Either<String, dynamic>> getTrailerMovie(int movieId);

  Future<Either<String, dynamic>> getRecommendationMovies(int movieId);

  Future<Either<String, dynamic>> getSimilarMovies(int movieId);

  Future<Either<String, dynamic>> searchMovie(String query);
}
