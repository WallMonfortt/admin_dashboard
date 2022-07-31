import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('formulario valido');
      print(email);
      print(password);

      return true;
    } else {
      print('formulario invalido');
      return false;
    }
  }
}
