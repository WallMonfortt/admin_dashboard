import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()){
      print('formulario valido');
      print(email);
      print(password);
    }else{
      print('formulario invalido');
    }
  }
}
