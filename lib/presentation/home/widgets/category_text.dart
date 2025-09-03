import 'package:flutter/material.dart';
import 'package:watch/core/configs/theme/app_colors.dart';

class CategoryText extends StatelessWidget {
  final String title;
  const CategoryText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.white,
        ),
      ),
    );
  }
}
