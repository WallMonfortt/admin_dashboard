import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TODO: Update the user

  bool _isValidForm() {
    return formKey.currentState!.validate();
  }

  updateUser() {
    if (!_isValidForm()) return;
    print(' Info a postear');
    print('Nombre: ${user!.nombre}');
    print('Email: ${user!.correo}');
  }
}
