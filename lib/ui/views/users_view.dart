import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersDataSource = UsersDTS();
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
              PaginatedDataTable(columns: [
                DataColumn(label: Text('Avatar')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('UID')),
                DataColumn(label: Text('Acciones')),
              ], source: usersDataSource)
            ]));
  }
}

//This is a template for the dashboard layout view
