import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/domain/movie/usecases/search_movie.dart';
import 'package:watch/domain/tv/usecases/search_tv.dart';
import 'package:watch/presentation/search/bloc/search_state.dart';
import 'package:watch/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:watch/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final TextEditingController controllerQuery = TextEditingController();

  void search(String query, SelectType selectType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (selectType) {
        case SelectType.movie:
          searchMovie(query);
          break;

        case SelectType.tv:
          searchTv(query);
          break;
      }
    }
  }

  searchMovie(String query) async {
    var data = await sl<SearchMovieUseCase>().call(params: query);

    data.fold(
      (error) {
        emit(SearchFailureLoad(errorMessage: error));
      },
      (data) {
        emit(MovieLoaded(movies: data));
      },
    );
  }

  searchTv(String query) async {
    var data = await sl<SearchTvUseCase>().call(params: query);

    data.fold(
      (error) {
        emit(SearchFailureLoad(errorMessage: error));
      },
      (data) {
        emit(TvLoaded(tvs: data));
      },
    );
  }
}
