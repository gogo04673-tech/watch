import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch/common/helper/navigation/app_navigation.dart';
import 'package:watch/core/configs/theme/app_colors.dart';
import 'package:watch/core/functions/edit_title_cart.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/presentation/watch/page/movie_watch.dart';

class MovieCart extends StatelessWidget {
  const MovieCart({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.push(context, MovieWatch(movieEntity: movie));
      },
      child: Column(
        children: [
          Container(
            width: 160,

            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            // * child
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              child: Hero(
                tag: movie.id!,
                child: CachedNetworkImage(
                  imageUrl: movie.providerPosterPath(),
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Text
          Text(
            editTitle(movie.title!),
            style: TextStyle(
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              height: 1.6,
            ),
          ),

          // Row vote average
          Row(
            children: [
              const SizedBox(width: 125),
              Icon(Icons.star, color: Colors.yellow, size: 15),
              Text(
                movie.voteAverage!.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
