// Note: Las vistas no tienen un scaffold

import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 370,
                ),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        // validator: ,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // validator: ,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                          hint: '******',
                          label: 'Contraseña',
                          icon: Icons.lock_clock_outlined,
                        ),
                      ),
                      SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          // TODO: implementar ir a
                        },
                        )
                    ],
                  ),
                ))));
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) =>
      InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
      );
}
