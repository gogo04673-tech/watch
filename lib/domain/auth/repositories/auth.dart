import 'package:dartz/dartz.dart';
import 'package:watch/data/auth/models/signin_req_params.dart';
import 'package:watch/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either<String, Map<String, dynamic>>> signup(SignupReqParams params);

  Future<Either<String, Map<String, dynamic>>> signin(SigninReqParams params);

  Future<bool> isLogger();
}
