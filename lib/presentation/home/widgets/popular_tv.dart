import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/widgets/tv/tv_cart.dart';
import 'package:watch/domain/tv/entities/tv.dart';
import 'package:watch/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:watch/presentation/home/bloc/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => PopularTvCubit()..getPopularTv(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvStateLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PopularTvFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is PopularTvStateLoaded) {
            return Container(
              height: 250,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  TvEntity tv = state.tv[i];
                  return TvCart(tv: tv, onTapTv: () {});
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.tv.length,
              ),
            );
          }
          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
