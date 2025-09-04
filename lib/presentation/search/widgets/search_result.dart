import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/widgets/movie/movie_cart.dart';
import 'package:watch/common/widgets/tv/tv_cart.dart';
import 'package:watch/presentation/search/bloc/search_cubit.dart';
import 'package:watch/presentation/search/bloc/search_state.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        }
        // failure
        if (state is SearchFailureLoad) {
          return Center(child: Text(state.errorMessage));
        }
        // Movie
        if (state is MovieLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.73,
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, i) {
              return MovieCart(movie: state.movies[i]);
            },
          );
        }
        // Tv
        if (state is TvLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.73,
              // mainAxisExtent: 10,
              // crossAxisSpacing: 10,
            ),
            itemCount: state.tvs.length,
            itemBuilder: (context, i) {
              return TvCart(tv: state.tvs[i]);
            },
          );
        }

        return Center(child: Text("No things Happens"));
      },
    );
  }
}
