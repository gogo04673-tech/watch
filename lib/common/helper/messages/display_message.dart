import 'package:flutter/material.dart';

class DisplayMessage {
  void errorMessage(String message, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
