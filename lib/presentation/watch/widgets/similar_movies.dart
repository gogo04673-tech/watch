import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/widgets/movie/movie_cart.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/presentation/watch/bloc/similar_cubit.dart';
import 'package:watch/presentation/watch/bloc/similar_state.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => SimilarCubit()..getSimilarMovie(movieId),
      child: BlocBuilder<SimilarCubit, SimilarState>(
        builder: (context, state) {
          if (state is SimilarLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is SimilarFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is SimilarLoaded) {
            return Container(
              height: 250,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  MovieEntity movie = state.similar[i];
                  return MovieCart(movie: movie);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.similar.length,
              ),
            );
          }

          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
