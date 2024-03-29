// Note: Las vistas no tienen un scaffold

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 370,
                      ),
                      child: Form(
                        autovalidateMode: AutovalidateMode
                            .always, // Valida el formulario siempre que se cambie algo en el formulario
                        key: loginFormProvider.formKey, // Key del formulario
                        child: Column(
                          children: [
                            TextFormField(
                              onFieldSubmitted: (_) =>
                                  onformSubmit(loginFormProvider, authProvider),
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
                              style: const TextStyle(color: Colors.white),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su correo',
                                label: 'Email',
                                icon: Icons.email_outlined,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              onFieldSubmitted: (_) =>
                                  onformSubmit(loginFormProvider, authProvider),
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
                              style: const TextStyle(color: Colors.white),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: '******',
                                label: 'Contraseña',
                                icon: Icons.lock_clock_outlined,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomOutlinedButton(
                              onPressed: () =>
                                  onformSubmit(loginFormProvider, authProvider),
                              text: 'Ingresar',
                            ),
                            const SizedBox(height: 20),
                            LinkText(
                              text: 'Nueva cuenta',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Flurorouter.registerRoute);
                              },
                            )
                          ],
                        ),
                      ))));
        }));
  }

  void onformSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm(); // Valida el formulario
    if (isValid) {
      authProvider.login(
          loginFormProvider.email, loginFormProvider.password); // Inicia sesion
    }
  }
}
