import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  // This is a provider for the users view
  List<Usuario> users = [];
  bool _isLoading = true;

  UsersProvider() {
    this.getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(resp);
    users = [...usersResponse.usuarios];
    _isLoading = false;

    notifyListeners();
  }
}
