import 'package:flutter/material.dart';
import 'package:watch/core/configs/theme/app_colors.dart';

class VoteAverageMovie extends StatelessWidget {
  const VoteAverageMovie({super.key, required this.voteAverage});
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow, size: 20),
        const SizedBox(width: 5),
        Text(
          voteAverage,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),
      ],
    );
  }
}
