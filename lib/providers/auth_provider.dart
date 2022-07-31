import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    // TODO: Peticion http

    _token = 'edederferfefef';

    print('_token $_token');

    // TODO: Navegar al dashboard
    notifyListeners();
  }
}
