import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

import '../../providers/providers.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'Users',
                style: CustomLabels.h1,
              ),
              const SizedBox(height: 10),
              PaginatedDataTable(
                sortAscending: usersProvider.ascending,
                sortColumnIndex: usersProvider.sortColumnIndex,
                columns: [
                  const DataColumn(label: Text('Avatar')),
                  DataColumn(
                      label: const Text('Nombre'),
                      onSort: (columnIndex, _) {
                        usersProvider.sortColumnIndex = columnIndex;
                        usersProvider.sort<String>(((user) => user.nombre));
                      }),
                  DataColumn(
                      label: const Text('Email'),
                      onSort: (columnIndex, _) {
                        usersProvider.sortColumnIndex = columnIndex;
                        usersProvider.sort<String>(((user) => user.correo));
                      }),
                  const DataColumn(label: Text('UID')),
                  const DataColumn(label: Text('Acciones')),
                ],
                source: usersDataSource,
                onPageChanged: (page) {
                  // print('Page: $page');
                },
              )
            ]));
  }
}

//This is a template for the dashboard layout view
