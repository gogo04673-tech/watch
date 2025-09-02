import 'package:flutter/material.dart';
import 'package:watch/presentation/home/widgets/trending.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar is here
      appBar: AppBar(title: Text("Watch")),
      // body is here
      body: SingleChildScrollView(child: Column(children: [TrendingMovies()])),
    );
  }
}
