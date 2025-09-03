import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/presentation/watch/bloc/trailer_cubit.dart';
import 'package:watch/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTrailer extends StatelessWidget {
  final int movieId;
  const VideoTrailer({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => TrailerCubit()..getTrailerMovie(movieId),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerStateLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // * Failure
          if (state is TrailerStateFailureLoad) {
            return Center(child: Text(state.errorMessage));
          }

          // * Loaded
          if (state is TrailerStateLoaded) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: YoutubePlayer(
                controller: state.youtubePlayerController,
                showVideoProgressIndicator: true,
              ),
            );
          }

          return Text("No Things happiness");
        },
      ),
    );
  }
}
