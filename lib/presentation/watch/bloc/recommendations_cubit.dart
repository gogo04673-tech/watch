import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:watch/domain/movie/usecases/get_recommendation_movies.dart';

import 'package:watch/presentation/watch/bloc/recommendations_state.dart';

import 'package:watch/service_locator.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit() : super(RecommendationsLoading());

  void getRecommendationsMovie(int movieId) async {
    var data = await sl<GetRecommendationMoviesUseCase>().call(params: movieId);

    data.fold(
      (error) {
        emit(RecommendationsFailureLoad(errorMessage: error));
      },
      (data) {
        emit(RecommendationsLoaded(recommendations: data));
      },
    );
  }
}
