import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:watch/core/entities/trailer.dart';
import 'package:watch/domain/movie/usecases/get_trailer_movie.dart';
import 'package:watch/presentation/watch/bloc/trailer_state.dart';
import 'package:watch/service_locator.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerStateLoading());

  void getTrailerMovie(int movieId) async {
    var data = await sl<GetTrailerMovieUseCase>().call(params: movieId);

    data.fold(
      (error) {
        emit(TrailerStateFailureLoad(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailer = await data;

        // YoutubePlayerController controller = YoutubePlayerController(
        //   initialVideoId: trailer.key!,
        //   flags: YoutubePlayerFlags(autoPlay: false),
        // );
        YoutubePlayerController controller =
            YoutubePlayerController.fromVideoId(
              videoId: trailer.key!,
              autoPlay: false,
              params: const YoutubePlayerParams(showFullscreenButton: true),
            );

        emit(TrailerStateLoaded(youtubePlayerController: controller));
      },
    );
  }
}
