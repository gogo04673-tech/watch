import 'package:watch/data/movie/models/movie.dart';
import 'package:watch/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      id: movie.id,
      title: movie.title,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      posterPath: movie.posterPath,
      mediaType: movie.mediaType,
      originalLanguage: movie.originalLanguage,
      genreIds: movie.genreIds,
      popularity: movie.popularity,
      releaseDate: movie.releaseDate,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
