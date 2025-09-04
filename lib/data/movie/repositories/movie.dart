import 'package:dartz/dartz.dart';
import 'package:watch/common/helper/mapper/movie.dart';
import 'package:watch/common/helper/mapper/trailer.dart';
import 'package:watch/core/models/trailer.dart';
import 'package:watch/data/movie/models/movie.dart';
import 'package:watch/data/movie/sources/movie_service.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<String, dynamic>> getTrendingMovies() async {
    var data = await sl<MovieService>().getTrendingMovies();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['data'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getNowPlayingMovies() async {
    var data = await sl<MovieService>().getNowPlayingMovies();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['data'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getTrailerMovie(int movieId) async {
    var data = await sl<MovieService>().getTrailerMovie(movieId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        if (data['data'] == null) {
          return Left(data['message']);
        }
        var trailer = TrailerMapper.toEntity(
          TrailerModel.fromJson(data['data']),
        );
        return Right(trailer);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getRecommendationMovies(int movieId) async {
    var data = await sl<MovieService>().getTRecommendationMovies(movieId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var recommendation = List.from(data['data'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();
        return Right(recommendation);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getSimilarMovies(int movieId) async {
    var data = await sl<MovieService>().getSimilarMovies(movieId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var recommendation = List.from(data['data'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();
        return Right(recommendation);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> searchMovie(String query) async {
    var data = await sl<MovieService>().searchMovie(query);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var searchMovie = List.from(data['data'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();
        return Right(searchMovie);
      },
    );
  }
}
