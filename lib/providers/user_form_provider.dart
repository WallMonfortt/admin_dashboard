import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isValidForm() {
    return formKey.currentState!.validate();
  }

  copyUserWith({
    // This is a function to copy the user with the new values
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  updateUser() {
    if (!_isValidForm()) return;
    print(' Info a postear');
    print('Nombre: ${user!.nombre}');
    print('Email: ${user!.correo}');
  }
}
