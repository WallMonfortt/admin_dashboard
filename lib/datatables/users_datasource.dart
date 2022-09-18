import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;

  UsersDTS(this.users);

  @override
  DataRow getRow(int index) {
    final user = users[index];

    final image = Image(
      image: Image.network('./assets/no-image.jpg').image,
      width: 35,
      height: 35,
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
            // TODO: Navigate to edit user
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
