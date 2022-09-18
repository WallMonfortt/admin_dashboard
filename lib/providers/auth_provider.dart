import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, unauthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    final data = {'correo': email, 'password': password};

    CafeApi.post('/auth/login', data).then((response) {
      final authResponse = AuthResponse.fromMap(response);
      _token = authResponse.token;
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', _token!);
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((error) {
      NotificationService.showSnackbarError(
          'Usuario o contraseña incorrectos: $error');
    });
  }

  register(String email, String password, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('error en : $e');
      // TODO: Mostrar alerta
      NotificationService.showSnackbarError(
          'Usuario / Password incorrecto: $e');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.unauthenticated;
      return false;
    }

    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      _token = authResponse.token;
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(
          'error en : $e'); // try to avoid print in production because it's a bad practice
      authStatus = AuthStatus.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    _token = null;
    user = null;
    authStatus = AuthStatus.unauthenticated;
    LocalStorage.prefs.remove('token');
    notifyListeners();
  }
}
