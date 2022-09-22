import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TODO: Update the user

  bool isValidForm() {
    return formKey.currentState!.validate();
  }
}
