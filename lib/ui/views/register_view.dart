// Note: Las vistas no tienen un scaffold
import 'package:admin_dashboard/providers/providers.dart';

import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            RegisterFormProvider(), // Crea el provider de formulario de login
        child: Builder(
          builder: (context) {
            final registerFormProvider = Provider.of<RegisterFormProvider>(
                context,
                listen: false); // ignore: deprecated_member_use
            return Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 370,
                        ),
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: registerFormProvider
                              .formKey, // Valida el formulario siempre que se cambie algo en el formulario
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El campo nombre no puede estar vacio';
                                  }
                                  return null;
                                },
                                onChanged: (value) =>
                                    registerFormProvider.name = value,
                                style: const TextStyle(color: Colors.white),
                                decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su nombre',
                                  label: 'Nombre',
                                  icon: Icons.supervised_user_circle_outlined,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El campo no puede estar vacio';
                                  } else if (!EmailValidator.validate(value)) {
                                    // Valida el email mediante la libreria email_validator
                                    return 'El email no es valido';
                                  }
                                  return null;
                                },
                                onChanged: (value) =>
                                    registerFormProvider.email = value,
                                style: const TextStyle(color: Colors.white),
                                decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su correo',
                                  label: 'Email',
                                  icon: Icons.email_outlined,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ingrese su contraseña';
                                  } else if (value.length < 6) {
                                    return 'La contraseña debe tener al menos 6 caracteres';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) =>
                                    registerFormProvider.password = value,
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
                                onPressed: () {
                                  final isFormValid =
                                      registerFormProvider.validateForm();
                                  if (!isFormValid) return;
                                  final authProvider =
                                      Provider.of<AuthProvider>(context,
                                          listen: false);
                                  authProvider.register(
                                    registerFormProvider.email,
                                    registerFormProvider.password,
                                    registerFormProvider.name,
                                  );
                                },
                                text: 'Crear cuenta',
                              ),
                              const SizedBox(height: 20),
                              LinkText(
                                text: 'Ir a login',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Flurorouter.loginRoute);
                                },
                              )
                            ],
                          ),
                        ))));
          },
        ));
  }
}
