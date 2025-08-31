import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch/core/constants/api_url.dart';
import 'package:watch/core/network/dio_client.dart';
import 'package:watch/data/models/auth/signin_req_params.dart';
import 'package:watch/data/models/auth/signup_req_params.dart';
import 'package:watch/service_locator.dart';

abstract class AuthApiService {
  Future<Either<String, Map<String, dynamic>>> signup(SignupReqParams params);
  Future<Either<String, Map<String, dynamic>>> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either<String, Map<String, dynamic>>> signup(
    SignupReqParams params,
  ) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toJson(),
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> signin(
    SigninReqParams params,
  ) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toJson(),
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
