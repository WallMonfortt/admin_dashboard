import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      // print('formulario valido');
      // print(email);
      // print(password);
      // print(name);
      return true;
    } else {
      // print('formulario invalido');
      return false;
    }
  }
}
