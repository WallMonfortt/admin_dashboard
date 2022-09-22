import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid; // This is the user id to show the information of the user
  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      userFormProvider.user = userDB;
      setState(() {
        user = userDB;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                'User view',
                style: CustomLabels.h1,
              ),
              SizedBox(height: 10),
              if (user == null)
                WhiteCard(
                    child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: CircularProgressIndicator(),
                )),
              if (user != null) _UserViewBody()
            ]));
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        //TODO: Ancho de la columna
        columnWidths: {
          0: FixedColumnWidth(250),
        },

        children: [
          TableRow(children: [
            //TODO: Avatar
            _AvatarContainer(),
            // TDOO: Formulario de actualizacion
            _UserViewForm()
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    return WhiteCard(
      title: 'Informacion del usuario',
      child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                initialValue: user.nombre,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined),
                onChanged: (value) => userFormProvider.copyUserWith(
                    nombre: value), // This is to update the user name
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio';
                  }
                  if (value.length < 2) {
                    return 'El correo debe tener mas de 2 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: user.correo,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo del usuario',
                    label: 'correo',
                    icon: Icons.mark_email_read_outlined),
                onChanged: (value) => userFormProvider.copyUserWith(
                    correo: value), // This is to update the user email
                validator: (value) {
                  if (!EmailValidator.validate(value ?? ''))
                    return 'Email no valido';
                  return null;
                },
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 120),
                child: ElevatedButton(
                    onPressed: () {
                      //TODO: Actualizar usuario
                      userFormProvider.updateUser();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.save_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Guardar')
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(
        context); // This is the user to show the information of the user
    final user = userFormProvider.user!;
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity, // Take all the width of the parent
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h2),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  // Stack is used to overlap widgets
                  children: [
                    ClipOval(
                        child: Image(
                            image:
                                Image.network('./assets/no-image.jpg').image)),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            elevation: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                            ),
                            onPressed: () {
                              //TODO: Seleccionar la imagen
                            },
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                user.nombre,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ]),
      ),
    );
  }
}
