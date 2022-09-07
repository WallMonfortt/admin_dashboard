import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            // Is more flexible to show content
            physics: ClampingScrollPhysics(),
            children: [
          Text(
            'Categorias',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado po')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS(),
          ),
        ]));
  }
}

//This is a template for the dashboard layout view
