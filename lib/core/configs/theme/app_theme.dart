import 'package:flutter/material.dart';
import 'package:watch/core/configs/theme/app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: AppColors.background,

    // * ============> This Text theme <============ * //
    // textTheme: TextTheme(
    //   bodyMedium: TextStyle(color: Colors.white),
    //   bodyLarge: TextStyle(color: Colors.white),
    //   bodySmall: TextStyle(color: Colors.white),
    // ),

    // * ============> Appbar theme <============ * //
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,

      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),

    // * ============> This Input Text field theme <============ * //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondBackground,

      hintStyle: const TextStyle(
        color: Color(0xff717171),
        fontWeight: FontWeight.w400,
        height: 0.6,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
