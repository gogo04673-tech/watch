import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/bloc/generic_data_cubit.dart';
import 'package:watch/common/bloc/generic_data_state.dart';
import 'package:watch/common/widgets/tv/tv_cart.dart';
import 'package:watch/domain/tv/entities/tv.dart';
import 'package:watch/domain/tv/usecases/get_similar_tv.dart';
import 'package:watch/service_locator.dart';

class SimilarTv extends StatelessWidget {
  const SimilarTv({super.key, required this.tvId});

  final int tvId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) =>
          GenericDataCubit()
            ..getData<List<TvEntity>>(sl<GetSimilarTvUseCase>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is DataLoaded) {
            return Container(
              height: 250,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  TvEntity tv = state.data[i];
                  return TvCart(tv: tv);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.data.length,
              ),
            );
          }

          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
