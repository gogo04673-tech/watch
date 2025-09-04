import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/presentation/search/bloc/search_cubit.dart';
import 'package:watch/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:watch/presentation/search/widgets/search_field.dart';
import 'package:watch/presentation/search/widgets/search_option.dart';
import 'package:watch/presentation/search/widgets/search_result.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search"), centerTitle: true),

      //
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SearchField(),

              const SizedBox(height: 10),

              const SearchOption(),

              const SizedBox(height: 10),

              Expanded(child: const SearchResult()),
            ],
          ),
        ),
      ),
    );
  }
}
