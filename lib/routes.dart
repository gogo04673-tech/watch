import 'package:flutter/material.dart';
import 'package:watch/core/configs/routes/app_routes.dart';
import 'package:watch/presentation/auth/pages/signin.dart';
import 'package:watch/presentation/auth/pages/signup.dart';
import 'package:watch/presentation/home/pages/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // * ============> Home Page Route <============ * //
  AppRoutes.homePage: (context) => HomePage(),

  // * ============> Auth Pages Route <============ * //
  AppRoutes.signinPage: (context) => SigninPage(),

  AppRoutes.signupPage: (context) => SignupPage(),
};
