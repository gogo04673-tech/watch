import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch/data/models/auth/signin_req_params.dart';
import 'package:watch/data/models/auth/signup_req_params.dart';
import 'package:watch/data/sources/auth/auth_api_service.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  // @override
  // Future<Either<String, Map<String, dynamic>>> signup(
  //   SignupReqParams params,
  // ) async {
  //   var data = await sl<AuthApiService>().signup(params);
  //   return data.fold(
  //     (error) {
  //       return Left(error);
  //     },

  //     (data) async {
  //       final SharedPreferences sharedPreferences =
  //           await SharedPreferences.getInstance();
  //       sharedPreferences.setString("id", data['data']['users_id'].toString());
  //       sharedPreferences.setString("username", data['data']['users_name']);
  //       sharedPreferences.setString("email", data['data']['users_email']);

  //       return Right(data);
  //     },
  //   );
  // }

  // @override
  // Future<Either<String, Map<String, dynamic>>> signin(
  //   SigninReqParams params,
  // ) async {
  //   var data = await sl<AuthApiService>().signin(params);

  //   return data.fold(
  //     (error) {
  //       return Left(error);
  //     },

  //     (data) async {
  //       final SharedPreferences sharedPreferences =
  //           await SharedPreferences.getInstance();
  //       sharedPreferences.setString("id", data['data']['users_id'].toString());
  //       sharedPreferences.setString("username", data['data']['users_name']);
  //       sharedPreferences.setString("email", data['data']['users_email']);
  //       return Right(data);
  //     },
  //   );
  // }

  @override
  Future<bool> isLogger() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    if (sharedPreferences.getString("id") == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> signin(
    SigninReqParams params,
  ) async {
    var result = await sl<AuthApiService>().signin(params);

    if (result.isLeft()) {
      return result;
    }

    // success
    final data = result.getOrElse(() => {});
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("id", data['data']['users_id'].toString());
    sharedPreferences.setString("username", data['data']['users_name']);
    sharedPreferences.setString("email", data['data']['users_email']);

    return result;
  }

  @override
  Future<Either<String, Map<String, dynamic>>> signup(
    SignupReqParams params,
  ) async {
    var result = await sl<AuthApiService>().signup(params);

    if (result.isLeft()) {
      return result;
    }

    // success
    final data = result.getOrElse(() => {});
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("id", data['data']['users_id'].toString());
    sharedPreferences.setString("username", data['data']['users_name']);
    sharedPreferences.setString("email", data['data']['users_email']);

    return result;
  }
}
