import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/tv/repositories/tv.dart';
import 'package:watch/service_locator.dart';

class GetRecommendationsTvUseCase
    extends UseCase<Either<String, dynamic>, int> {
  @override
  Future<Either<String, dynamic>> call({int? params}) async {
    return await sl<TvRepository>().getRecommendationsTv(params!);
  }
}
