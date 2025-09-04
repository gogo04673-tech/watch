import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch/core/constants/api_url.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/service_locator.dart';

abstract class MovieService {
  Future<Either<String, dynamic>> getTrendingMovies();

  Future<Either<String, dynamic>> getNowPlayingMovies();

  Future<Either<String, dynamic>> getTrailerMovie(int movieId);

  Future<Either<String, dynamic>> getTRecommendationMovies(int movieId);

  Future<Either<String, dynamic>> getSimilarMovies(int movieId);

  Future<Either<String, dynamic>> searchMovie(String query);
}

class MovieServiceImpl extends MovieService {
  get params => null;

  @override
  Future<Either<String, dynamic>> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.moviesTrending);

      return Right(jsonDecode(response.data));
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.moviesNowPlaying);

      return Right(jsonDecode(response.data));
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> getTrailerMovie(int movieId) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.moviesTrailer,
        data: {"movieId": movieId},
      );
      return Right(response.data);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> getTRecommendationMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.moviesRecommendation,
        data: {"movieId": movieId},
      );
      return Right(response.data);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> getSimilarMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.moviesSimilar,
        data: {"movieId": movieId},
      );
      return Right(response.data);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> searchMovie(String query) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.moviesSearch,
        data: {"query": query},
      );
      return Right(response.data);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
