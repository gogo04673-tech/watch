import 'package:dartz/dartz.dart';
import 'package:watch/common/helper/mapper/keyword.dart';
import 'package:watch/common/helper/mapper/tv.dart';
import 'package:watch/core/models/keyword.dart';
import 'package:watch/data/tv/models/tv.dart';
import 'package:watch/data/tv/source/tv_service.dart';
import 'package:watch/domain/tv/repositories/tv.dart';
import 'package:watch/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either<String, dynamic>> getPopularTv() async {
    var data = await sl<TvService>().getPopularTv();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(
          data['data'],
        ).map((tv) => TvMapper.toEntity(TvModel.fromJson(tv))).toList();

        return Right(tv);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getRecommendationsTv(int tvId) async {
    var data = await sl<TvService>().getTRecommendationsTv(tvId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var recommendation = List.from(
          data['data'],
        ).map((tv) => TvMapper.toEntity(TvModel.fromJson(tv))).toList();
        return Right(recommendation);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getSimilarTv(int tvId) async {
    var data = await sl<TvService>().getSimilarTv(tvId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var similar = List.from(
          data['data'],
        ).map((tv) => TvMapper.toEntity(TvModel.fromJson(tv))).toList();
        return Right(similar);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getKeywordsTv(int tvId) async {
    var data = await sl<TvService>().getSimilarTv(tvId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var keywords = List.from(data['data'])
            .map(
              (keyword) =>
                  KeywordMapper.toEntity(KeywordModel.fromJson(keyword)),
            )
            .toList();
        return Right(keywords);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> searchTv(String query) async {
    var data = await sl<TvService>().searchTv(query);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var searchTv = List.from(
          data['data'],
        ).map((tv) => TvMapper.toEntity(TvModel.fromJson(tv))).toList();
        return Right(searchTv);
      },
    );
  }
}
