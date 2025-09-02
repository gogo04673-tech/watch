import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch/core/constants/api_url.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/service_locator.dart';

abstract class MovieService {
  Future<Either<String, dynamic>> getTrendingMovies();
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
}
