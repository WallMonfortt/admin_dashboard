import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                'Users',
                style: CustomLabels.h1,
              ),
              SizedBox(height: 10),
              WhiteCard(
                title: 'Users view',
                child: Text('Hola Mundo'),
              )
            ]));
  }
}

//This is a template for the dashboard layout view
