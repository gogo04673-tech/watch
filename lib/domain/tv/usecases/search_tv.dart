import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/tv/repositories/tv.dart';
import 'package:watch/service_locator.dart';

class SearchTvUseCase extends UseCase<Either<String, dynamic>, String> {
  @override
  Future<Either<String, dynamic>> call({String? params}) async {
    return await sl<TvRepository>().searchTv(params!);
  }
}
