import 'package:dartz/dartz.dart';
import 'package:watch/core/usecases/use_case.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/service_locator.dart';

class SearchMovieUseCase extends UseCase<Either<String, dynamic>, String> {
  @override
  Future<Either<String, dynamic>> call({String? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
}
