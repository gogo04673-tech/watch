import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/presentation/search/bloc/search_cubit.dart';
import 'package:watch/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:watch/presentation/search/widgets/selectable_option.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SelectType>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              title: "Movie",
              isSelected:
                  context.read<SelectableOptionCubit>().state ==
                  SelectType.movie,
              onTap: () {
                context.read<SelectableOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().controllerQuery.text,
                  context.read<SelectableOptionCubit>().state,
                );
              },
            ),

            SelectableOption(
              title: "TV",
              isSelected:
                  context.read<SelectableOptionCubit>().state == SelectType.tv,
              onTap: () {
                context.read<SelectableOptionCubit>().selectTv();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().controllerQuery.text,
                  context.read<SelectableOptionCubit>().state,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
