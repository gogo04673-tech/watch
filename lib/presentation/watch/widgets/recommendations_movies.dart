import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/widgets/movie/movie_cart.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/presentation/watch/bloc/recommendations_cubit.dart';
import 'package:watch/presentation/watch/bloc/recommendations_state.dart';

class RecommendationsMovies extends StatelessWidget {
  const RecommendationsMovies({super.key, required this.movieId});

  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) =>
          RecommendationsCubit()..getRecommendationsMovie(movieId),
      child: BlocBuilder<RecommendationsCubit, RecommendationsState>(
        builder: (context, state) {
          if (state is RecommendationsLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is RecommendationsFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is RecommendationsLoaded) {
            return Container(
              height: 250,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  MovieEntity movie = state.recommendations[i];
                  return MovieCart(movie: movie);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.recommendations.length,
              ),
            );
          }

          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
