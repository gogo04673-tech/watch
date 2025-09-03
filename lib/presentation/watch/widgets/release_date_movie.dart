import 'package:flutter/material.dart';
import 'package:watch/core/configs/theme/app_colors.dart';

class ReleaseDateMovie extends StatelessWidget {
  const ReleaseDateMovie({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month, color: AppColors.grey, size: 20),
        SizedBox(width: 5),
        Text(
          data.split(' ')[0],
          style: TextStyle(color: AppColors.grey, height: 2),
        ),
      ],
    );
  }
}
