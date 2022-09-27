import 'dart:typed_data';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  late GlobalKey<FormState> formKey;

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

  Future updateUser() async {
    if (!_isValidForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      final resp = await CafeApi.put('/usuarios/${user!.uid}', data);
      // print(resp);
      return true;
    } catch (e) {
      // print('Error in updateUser: $e');
      return false;
    }
  }

  Future<Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await CafeApi.uploadFile(path, bytes);
      final user = Usuario.fromMap(resp);
      notifyListeners();
      return user;
    } catch (e) {
      // print('Error in uploadImage: $e');
      throw 'Error in uploadImage: $e';
    }
  }
}
