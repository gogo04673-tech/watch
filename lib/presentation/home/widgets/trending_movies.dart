import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/bloc/generic_data_cubit.dart';
import 'package:watch/common/bloc/generic_data_state.dart';
import 'package:watch/core/configs/assets/app_images.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/domain/movie/usecases/get_trending_movies.dart';
import 'package:watch/service_locator.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) =>
          GenericDataCubit()
            ..getData<List<MovieEntity>>(sl<GetTrendingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is DataLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: (state.data as List<MovieEntity>)
                  .map(
                    (movie) =>
                        AppImages.movieImageBasePath +
                        movie.posterPath!.toString(),
                  )
                  .toList(),

              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: false,
            );
          }

          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
