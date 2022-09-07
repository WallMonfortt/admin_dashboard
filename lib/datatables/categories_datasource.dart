import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('cell#1 index : ${index}')),
        DataCell(Text('cell#2 index : ${index}')),
        DataCell(Text('cell#3 index : ${index}')),
        DataCell(Text('cell#4 index : ${index}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;
}
