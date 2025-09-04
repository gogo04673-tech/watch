import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/bloc/generic_data_cubit.dart';
import 'package:watch/common/bloc/generic_data_state.dart';
import 'package:watch/common/widgets/movie/movie_cart.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/domain/movie/usecases/get_similar_movies.dart';
import 'package:watch/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) =>
          GenericDataCubit()
            ..getData(sl<GetSimilarMoviesUseCase>(), params: movieId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is DataLoaded) {
            return Container(
              height: 250,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  MovieEntity movie = state.data[i];
                  return MovieCart(movie: movie);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.data.length,
              ),
            );
          }

          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
