import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);
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
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => CategoryModal(
                            categoria: categoria,
                          ));
                },
                icon: Icon(Icons.edit_outlined),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: Text('Esta seguro que deseas eliminarlo ?'),
                    content: Text(
                        'Esta accion no se puede deshacer, borrar el registro ${categoria.nombre}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Borrar'),
                      ),
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (_) =>
                          dialog, // this function is to create the dialog
                      barrierDismissible: false);
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
