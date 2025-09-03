import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/tv/repositories/tv.dart';
import 'package:watch/service_locator.dart';

class GetPopularTvUseCase extends UseCase<Either<String, dynamic>, dynamic> {
  @override
  Future<Either<String, dynamic>> call({params}) async {
    return await sl<TvRepository>().getPopularTv();
  }
}
