import 'package:flutter/material.dart';
import 'package:watch/core/configs/theme/app_colors.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/presentation/watch/widgets/recommendations_movies.dart';
import 'package:watch/presentation/watch/widgets/release_date_movie.dart';
import 'package:watch/presentation/watch/widgets/similar_movies.dart';
import 'package:watch/presentation/watch/widgets/video_trailer.dart';
import 'package:watch/presentation/watch/widgets/vote_average_movie.dart';
import 'package:watch/presentation/watch/widgets/watch_title.dart';

class MovieWatch extends StatelessWidget {
  const MovieWatch({super.key, required this.movieEntity});
  final MovieEntity movieEntity;

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
            VideoTrailer(movieId: movieEntity.id!),
            WatchTitle(title: movieEntity.title!),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReleaseDateMovie(data: movieEntity.releaseDate.toString()),
                VoteAverageMovie(
                  voteAverage: movieEntity.voteAverage!.toStringAsFixed(1),
                ),
              ],
            ),

            //
            WatchTitle(title: "Overview"),
            Text(
              movieEntity.overview!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.grey),
            ),

            //
            WatchTitle(title: "Recommendation"),
            RecommendationsMovies(movieId: movieEntity.id!),

            WatchTitle(title: "Similar"),
            SimilarMovies(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
