import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    // TODO: Peticion http

    _token = 'edederferfefef';
    LocalStorage.prefs.setString('token', _token!);

    print('_token $_token');

    // TODO: Navegar al dashboard
    notifyListeners();
  }
}
