import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/widgets/movie/movie_cart.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/presentation/home/bloc/now_playing_cubit.dart';
import 'package:watch/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingStateLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is NowPlayingStateFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is NowPlayingStateLoaded) {
            return Container(
              height: 250,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  MovieEntity movie = state.movies[i];
                  return MovieCart(movie: movie);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
              ),
            );
          }
          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
