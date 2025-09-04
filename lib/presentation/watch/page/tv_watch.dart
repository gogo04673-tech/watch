import 'package:flutter/material.dart';
import 'package:watch/core/configs/theme/app_colors.dart';
import 'package:watch/domain/tv/entities/tv.dart';
import 'package:watch/presentation/watch/widgets/keywords.dart';
import 'package:watch/presentation/watch/widgets/release_date_movie.dart';
import 'package:watch/presentation/watch/widgets/tv/recommendations_tv.dart';
import 'package:watch/presentation/watch/widgets/tv/similar_tv.dart';
import 'package:watch/presentation/watch/widgets/video_trailer.dart';
import 'package:watch/presentation/watch/widgets/vote_average_movie.dart';
import 'package:watch/presentation/watch/widgets/watch_title.dart';

class TvWatch extends StatelessWidget {
  const TvWatch({super.key, required this.tvEntity});
  final TvEntity tvEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        leading: Icon(Icons.arrow_back, color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoTrailer(movieId: tvEntity.id!),
            WatchTitle(title: tvEntity.name!),

            //
            Keywords(tvId: tvEntity.id!),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReleaseDateMovie(data: tvEntity.firstAirDate.toString()),
                VoteAverageMovie(
                  voteAverage: tvEntity.voteAverage!.toStringAsFixed(1),
                ),
              ],
            ),

            //
            WatchTitle(title: "Overview"),
            Text(
              tvEntity.overview!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.grey),
            ),

            //
            WatchTitle(title: "Recommendation"),
            RecommendationsTv(tvId: tvEntity.id!),

            WatchTitle(title: "Similar"),
            SimilarTv(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}
