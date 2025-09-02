import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/data/auth/models/signin_req_params.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/service_locator.dart';

class SigninUseCase
    extends UseCase<Either<String, Map<String, dynamic>>, SigninReqParams> {
  @override
  Future<Either<String, Map<String, dynamic>>> call({
    SigninReqParams? params,
  }) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
