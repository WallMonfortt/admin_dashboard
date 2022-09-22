import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
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
    usersProvider
        .getUserById(widget.uid)
        .then((userDB) => setState(() => {user = userDB}));
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
            Container(
              width: 250,
              height: 200,
              color: Colors.blue,
            )
          ])
        ],
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Nombre de usuario',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ]),
      ),
    );
  }
}
