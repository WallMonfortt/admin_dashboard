import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  // This is a provider for the users view
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending =
      true; // For sorting the table in the view by name and email in ascending order
  int? sortColumnIndex;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(resp);
    users = [...usersResponse.usuarios];
    isLoading = false;

    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      // throw 'Error in getUserById: $e';
      return null;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    // sort<T> is a generic function to sort the users list
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue,
              aValue); // return the value of the comparison between the two values
    });

    ascending = !ascending; // Change the order of the list

    notifyListeners(); // This is to notify the listeners that the list has changed
  }

  /// This function is to refresh the user in the list
  void refreshUser(Usuario newUser) {
    // compare the uid of the user in the list with the uid of the new user
    final index = users.indexWhere((user) => user.uid == newUser.uid);
    users[index] = newUser; // replace the user in the list with the new user
    notifyListeners();
  }
}
