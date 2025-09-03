import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either<String, dynamic>> getPopularTv();
}
