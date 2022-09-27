import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
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
      if (userDB != null) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = GlobalKey<FormState>();
        setState(() {
          user = userDB;
        });
      } else {
        NavigationService.replaceTo('/admin/users');
      }
    });
  }

  @override
  // clean the user form provider when the view is disposed
  void dispose() {
    user = null;
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'User view',
                style: CustomLabels.h1,
              ),
              const SizedBox(height: 10),
              if (user == null)
                WhiteCard(
                    child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: const CircularProgressIndicator(),
                )),
              if (user != null) _UserViewBody()
            ]));
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(250),
      },
      children: [
        TableRow(children: [
          _AvatarContainer(),
          // TDOO: Formulario de actualizacion
          const _UserViewForm()
        ])
      ],
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
              const SizedBox(height: 20),
              TextFormField(
                initialValue: user.correo,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo del usuario',
                    label: 'correo',
                    icon: Icons.mark_email_read_outlined),
                onChanged: (value) => userFormProvider.copyUserWith(
                    correo: value), // This is to update the user email
                validator: (value) {
                  if (!EmailValidator.validate(value ?? '')) {
                    return 'Email no valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: ElevatedButton(
                    onPressed: () async {
                      final saved = await userFormProvider.updateUser();
                      if (saved) {
                        NotificationService.showSnackbarSuccess(
                            'Usuario actualizado');
                        Provider.of<UsersProvider>(context, listen: false)
                            .refreshUser(user);
                      } else {
                        NotificationService.showSnackbarError(
                            'No se pudo actualizar el usuario');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      children: const [
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

    final image = (user.img == null)
        ? Image(image: Image.network('./assets/no-image.jpg').image)
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);
    return WhiteCard(
      width: 250,
      child: SizedBox(
        width: double.infinity, // Take all the width of the parent
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h2),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 160,
                child: Stack(
                  // Stack is used to overlap widgets
                  children: [
                    ClipOval(child: image),
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
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                            ),
                            onPressed: () async {
                              try {
                                var path = (await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowMultiple: false,
                                  onFileLoading: (FilePickerStatus status) {
                                    status == FilePickerStatus.picking ||
                                            status == FilePickerStatus.done
                                        ? NotificationService.showBusyIndicator(
                                            context)
                                        : NotificationService.showSnackbarSuccess(
                                            'Imagen cargada, usuario actualizado');
                                  },
                                  allowedExtensions: ['jpg', 'png', 'jpeg'],
                                ))
                                    ?.files
                                    .first;
                                var file = path?.bytes;
                                final newUser =
                                    await userFormProvider.uploadImage(
                                        '/uploads/usuarios/${user.uid}', file!);
                                // print(newUser.img);
                                // update the user in the provider to show the new image
                                Provider.of<UsersProvider>(context,
                                        listen: false)
                                    .refreshUser(newUser);
                                // Close the busy indicator
                                Navigator.of(context)
                                    .pushNamed('/admin/users/${user.uid}');
                              } on PlatformException catch (e) {
                                // print('Unsupported operation' + e.toString());
                                NotificationService.showSnackbarError(
                                    'No se pudo cargar la imagen: ${e.message}');
                              } catch (e) {
                                print(e.toString());
                                Navigator.of(context)
                                    .pushNamed('/admin/users/${user.uid}');
                                NotificationService.showSnackbarError(
                                    'usuario no actualizado');
                              }
                            },
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                user.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ]),
      ),
    );
  }
}
