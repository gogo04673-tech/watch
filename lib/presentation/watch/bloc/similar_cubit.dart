import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/domain/movie/usecases/get_similar_movies.dart';
import 'package:watch/presentation/watch/bloc/similar_state.dart';
import 'package:watch/service_locator.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit() : super(SimilarLoading());

  void getSimilarMovie(int movieId) async {
    var data = await sl<GetSimilarMoviesUseCase>().call(params: movieId);

    data.fold(
      (error) {
        emit(SimilarFailureLoad(errorMessage: error));
      },
      (data) {
        emit(SimilarLoaded(similar: data));
      },
    );
  }
}
