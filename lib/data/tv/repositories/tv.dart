import 'package:dartz/dartz.dart';
import 'package:watch/common/helper/mapper/tv_mapper.dart';
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
}
