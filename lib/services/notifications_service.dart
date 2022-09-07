import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
      content:
          Text(message, style: TextStyle(color: Colors.white, fontSize: 18)),
      backgroundColor: Colors.red.withOpacity(0.8),
    );

    messagerKey.currentState!.showSnackBar(snackBar);
  }
}
