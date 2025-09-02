import 'package:dartz/dartz.dart';
import 'package:watch/common/helper/mapper/movie_mapper.dart';
import 'package:watch/data/movie/models/movie.dart';
import 'package:watch/data/movie/sources/movie_service.dart';
import 'package:watch/domain/movie/repositories/movie.dart';
import 'package:watch/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<String, dynamic>> getTrendingMovies() async {
    var data = await sl<MovieService>().getTrendingMovies();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['data'])
            .map((movie) => MovieMapper.toEntity(MovieModel.fromJson(movie)))
            .toList();

        return Right(movies);
      },
    );
  }
}
