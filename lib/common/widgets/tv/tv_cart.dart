import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch/core/configs/assets/app_images.dart';
import 'package:watch/core/configs/theme/app_colors.dart';
import 'package:watch/core/functions/edit_title_cart.dart';
import 'package:watch/domain/tv/entities/tv.dart';

class TvCart extends StatelessWidget {
  const TvCart({super.key, required this.onTapTv, required this.tv});
  final TvEntity tv;
  final void Function()? onTapTv;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapTv,
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
                tag: tv.id!,
                child: CachedNetworkImage(
                  imageUrl: AppImages.movieImageBasePath + tv.posterPath!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Text
          Text(
            editTitle(tv.name!),
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
                tv.voteAverage!.toStringAsFixed(1),
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
