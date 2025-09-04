import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/presentation/search/bloc/search_cubit.dart';
import 'package:watch/presentation/search/bloc/selectable_option_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().controllerQuery,
      onChanged: (value) {
        context.read<SearchCubit>().search(
          value,
          context.read<SelectableOptionCubit>().state,
        );
      },

      decoration: InputDecoration(hintText: "Search"),
    );
  }
}
