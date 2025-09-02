import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/domain/movie/usecases/get_trending_movies.dart';
import 'package:watch/presentation/home/bloc/trending_state.dart';
import 'package:watch/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingStateLoading());

  void getTrendingMovies() async {
    var data = await sl<GetTrendingMoviesUseCase>().call();

    data.fold(
      (error) {
        emit(TrendingStateFailureLoad(errorMessage: error));
      },
      (data) {
        emit(TrendingStateLoaded(movies: data));
      },
    );
  }
}
