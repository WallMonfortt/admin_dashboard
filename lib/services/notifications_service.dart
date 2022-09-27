import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
      backgroundColor: Colors.red.withOpacity(0.8),
    );

    messagerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbarSuccess(String message) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
      backgroundColor: Colors.green.withOpacity(0.8),
    );

    messagerKey.currentState!.showSnackBar(snackBar);
  }

  static showBusyIndicator(BuildContext context) {
    const AlertDialog dialog = AlertDialog(
        content: SizedBox(
      width: 100,
      height: 100,
      child: Center(child: CircularProgressIndicator()),
    ));

    showDialog(context: context, builder: (_) => dialog);
  }
}
