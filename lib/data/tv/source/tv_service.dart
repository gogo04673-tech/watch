import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch/core/constants/api_url.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/service_locator.dart';

abstract class TvService {
  Future<Either<String, dynamic>> getPopularTv();
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
}
