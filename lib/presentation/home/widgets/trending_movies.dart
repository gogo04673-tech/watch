import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/core/configs/assets/app_images.dart';
import 'package:watch/presentation/home/bloc/trending_cubit.dart';
import 'package:watch/presentation/home/bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingStateLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is TrendingStateFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is TrendingStateLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
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
