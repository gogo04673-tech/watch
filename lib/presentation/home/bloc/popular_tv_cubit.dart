import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/domain/tv/usecases/get_popular_tv.dart';
import 'package:watch/presentation/home/bloc/popular_tv_state.dart';
import 'package:watch/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvStateLoading());

  void getPopularTv() async {
    var data = await sl<GetPopularTvUseCase>().call();

    data.fold(
      (error) {
        emit(PopularTvFailureLoad(errorMessage: error));
      },
      (data) {
        emit(PopularTvStateLoaded(tv: data));
      },
    );
  }
}
