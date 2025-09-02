import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/auth/repositories/auth.dart';
import 'package:watch/service_locator.dart';

class IsLoggedUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLogger();
  }
}
