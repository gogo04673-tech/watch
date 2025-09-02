import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/service_locator.dart';

class GetTrendingMoviesUseCase
    extends UseCase<Either<String, dynamic>, dynamic> {
  @override
  Future<Either<String, dynamic>> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
