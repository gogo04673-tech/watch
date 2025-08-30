import 'package:flutter/material.dart';

class AppNavigation {
  static void pushReplacementNamed(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static void push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void pushNamedAndRemoveUntil(BuildContext context, String route) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(route, (Route<dynamic> routes) => false);
  }
}
