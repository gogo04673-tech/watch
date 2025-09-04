import 'package:flutter/material.dart';
import 'package:watch/common/helper/navigation/app_navigation.dart';
import 'package:watch/presentation/home/widgets/category_text.dart';
import 'package:watch/presentation/home/widgets/now_playings_movies.dart';
import 'package:watch/presentation/home/widgets/popular_tv.dart';
import 'package:watch/presentation/home/widgets/trending_movies.dart';
import 'package:watch/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar is here
      appBar: AppBar(
        title: Text("Watch"),
        actions: [
          IconButton(
            onPressed: () {
              AppNavigation.push(context, const SearchPage());
            },
            icon: Icon(Icons.search_outlined),
          ),
        ],
      ),
      // body is here
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: "Trending"),
            TrendingMovies(),

            CategoryText(title: "Now Playing"),
            const SizedBox(height: 10),
            NowPlayingMovies(),

            CategoryText(title: "Popular Tv"),
            const SizedBox(height: 10),
            PopularTv(),
          ],
        ),
      ),
    );
  }
}
