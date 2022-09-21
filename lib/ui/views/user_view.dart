import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UserView extends StatelessWidget {
  final String uid; // This is the user id to show the information of the user
  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                'Blank view',
                style: CustomLabels.h1,
              ),
              SizedBox(height: 10),
              WhiteCard(
                title: 'Sales statics',
                child: Text(uid),
              )
            ]));
  }
}

//This is a template for the dashboard layout view
