import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/data/auth/models/signup_req_params.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/service_locator.dart';

class SignupUseCase
    extends UseCase<Either<String, Map<String, dynamic>>, SignupReqParams> {
  @override
  Future<Either<String, Map<String, dynamic>>> call({
    SignupReqParams? params,
  }) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
