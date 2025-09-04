import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either<String, dynamic>> getPopularTv();

  Future<Either<String, dynamic>> getRecommendationsTv(int tvId);

  Future<Either<String, dynamic>> getSimilarTv(int tvId);

  Future<Either<String, dynamic>> getKeywordsTv(int tvId);

  Future<Either<String, dynamic>> searchTv(String query);
}
