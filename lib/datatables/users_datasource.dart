import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;

  UsersDTS(this.users);

  @override
  DataRow getRow(int index) {
    final user = users[index];

    final image = user.img == null
        ? Image(
            image: Image.network('./assets/no-image.jpg').image,
            width: 35,
            height: 35,
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.img!),
            radius: 17.5,
          );
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(child: image)),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(IconButton(
          icon: Icon(Icons.edit_outlined),
          color: Colors.blue,
          onPressed: () {
            NavigationService.replaceTo(
                'admin/users/${user.uid}'); // Navigate to the user view
          },
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
