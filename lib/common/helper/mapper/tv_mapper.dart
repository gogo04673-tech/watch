import 'package:watch/data/tv/models/tv.dart';
import 'package:watch/domain/tv/entities/tv.dart';

class TvMapper {
  static TvEntity toEntity(TvModel tv) {
    return TvEntity(
      adult: tv.adult,
      backdropPath: tv.backdropPath,
      genreIds: tv.genreIds,
      id: tv.id,
      originCountry: tv.originCountry,
      originalLanguage: tv.originalLanguage,
      originalName: tv.originalName,
      overview: tv.overview,
      popularity: tv.popularity,
      posterPath: tv.posterPath,
      firstAirDate: tv.firstAirDate,
      name: tv.name,
      voteAverage: tv.voteAverage,
      voteCount: tv.voteCount,
    );
  }
}
