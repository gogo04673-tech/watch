import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:watch/presentation/home/bloc/now_playing_state.dart';
import 'package:watch/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingStateLoading());

  void getNowPlayingMovies() async {
    var data = await sl<GetNowPlayingMoviesUseCase>().call();

    data.fold(
      (error) {
        emit(NowPlayingStateFailureLoad(errorMessage: error));
      },
      (data) {
        emit(NowPlayingStateLoaded(movies: data));
      },
    );
  }
}
