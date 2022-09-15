import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;

  CategoriesDTS(this.categorias);
  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  print('editing ${categoria.nombre}');
                },
                icon: Icon(Icons.edit_outlined),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {
                  print('deleting ${categoria.nombre}');
                },
                icon: Icon(Icons.delete_outline),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length; // length of the list of categories

  @override
  int get selectedRowCount => 0;
}
