// Note: Las vistas no tienen un scaffold

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // El provider debe estar aqui porque se accede a el hasta esta vista

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return ChangeNotifierProvider(
        create: (_) =>
            LoginFormProvider(), // Crea el provider de formulario de login
        child: Builder(builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(context,
              listen: false); // ignore: deprecated_member_use
          return Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 370,
                      ),
                      child: Form(
                        autovalidateMode: AutovalidateMode
                            .always, // Valida el formulario siempre que se cambie algo en el formulario
                        key: loginFormProvider.formKey, // Key del formulario
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El campo no puede estar vacio';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'El email no es valido';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  loginFormProvider.email = value,
                              style: TextStyle(color: Colors.white),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su correo',
                                label: 'Email',
                                icon: Icons.email_outlined,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese su contraseña';
                                }
                                if (value.length < 6) {
                                  return 'La contraseña debe tener al menos 6 caracteres';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  loginFormProvider.password = value,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: '******',
                                label: 'Contraseña',
                                icon: Icons.lock_clock_outlined,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomOutlinedButton(
                              onPressed: () {
                                final isValid = loginFormProvider
                                    .validateForm(); // Valida el formulario
                                if (!isValid) return;
                                final authProvider = Provider.of<AuthProvider>(
                                    context,
                                    listen:
                                        false); // ignore: deprecated_member_use
                                authProvider.login(loginFormProvider.email,
                                    loginFormProvider.password); // Login
                              },
                              text: 'Ingresar',
                            ),
                            SizedBox(height: 20),
                            LinkText(
                              text: 'Nueva cuenta',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Flurorouter.registerRoute);
                              },
                            )
                          ],
                        ),
                      ))));
        }));
  }
}
