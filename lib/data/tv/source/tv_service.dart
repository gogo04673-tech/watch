import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch/core/constants/api_url.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/service_locator.dart';

abstract class TvService {
  Future<Either<String, dynamic>> getPopularTv();

  Future<Either<String, dynamic>> getSimilarTv(int tvId);

  Future<Either<String, dynamic>> getTRecommendationsTv(int tvId);

  Future<Either<String, dynamic>> getTKeywordsTv(int tvId);

  Future<Either<String, dynamic>> searchTv(String query);
}

class TvServiceImpl extends TvService {
  @override
  Future<Either<String, dynamic>> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.tvPopular);

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
  Future<Either<String, dynamic>> getSimilarTv(int tvId) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.tvSimilar,
        data: {"tvId": tvId},
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
  Future<Either<String, dynamic>> getTRecommendationsTv(int tvId) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.tvRecommendations,
        data: {"tvId": tvId},
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
  Future<Either<String, dynamic>> getTKeywordsTv(int tvId) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.tvKeywords,
        data: {"tvId": tvId},
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
  Future<Either<String, dynamic>> searchTv(String query) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.tvSearch,
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
