import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/service_locator.dart';

class GetSimilarMoviesUseCase extends UseCase<Either<String, dynamic>, int> {
  @override
  Future<Either<String, dynamic>> call({int? params}) async {
    return await sl<MovieRepository>().getSimilarMovies(params!);
  }
}
