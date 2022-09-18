import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('Pepito ${index}')),
        DataCell(Text('Nombre ${index}')),
        DataCell(Text('Email ${index}')),
        DataCell(Text('UID ${index}')),
        DataCell(Text('Acciones   ${index}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
