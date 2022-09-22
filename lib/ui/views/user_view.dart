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
                ))
            ]));
  }
}

//This is a template for the dashboard layout view
