// Note: Las vistas no tienen un scaffold

import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 370,
                        ),
                        child: Form(
                          autovalidateMode: AutovalidateMode
                              .always, 
                          key: registerFormProvider.formKey,// Valida el formulario siempre que se cambie algo en el formulario
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
                                style: TextStyle(color: Colors.white),
                                decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su nombre',
                                  label: 'Nombre',
                                  icon: Icons.supervised_user_circle_outlined,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El campo no puede estar vacio';
                                  } else if (!EmailValidator.validate(value)) { // Valida el email mediante la libreria email_validator
                                    return 'El email no es valido';
                                  }
                                  return null;
                                },
                                onChanged: (value) =>
                                    registerFormProvider.email = value,
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
                                  } else if (value.length < 6) {
                                    return 'La contraseña debe tener al menos 6 caracteres';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) =>
                                    registerFormProvider.password = value,
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
                                  registerFormProvider.validateForm();
                                },
                                text: 'Crear cuenta',
                              ),
                              SizedBox(height: 20),
                              LinkText(
                                text: 'Ir a login',
                                onPressed: () {
                                  Navigator.pushNamed(
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
