import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/bloc/generic_data_cubit.dart';
import 'package:watch/common/bloc/generic_data_state.dart';
import 'package:watch/core/entities/keyword.dart';
import 'package:watch/domain/tv/usecases/get_keywords_tv.dart';
import 'package:watch/service_locator.dart';

class Keywords extends StatelessWidget {
  const Keywords({super.key, required this.tvId});
  final int tvId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => GenericDataCubit()
        ..getData<List<KeywordEntity>>(
          sl<GetKeywordsTvUseCase>(),
          params: tvId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataFailureLoad) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              children: keywords
                  .map((keyword) => Chip(label: Text(keyword.name!)))
                  .toList(),
            );
          }

          return Center(child: Text("No things happens"));
        },
      ),
    );
  }
}
