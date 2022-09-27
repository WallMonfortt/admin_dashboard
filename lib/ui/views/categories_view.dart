import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';

import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    // listen: false because we don't need to listen to this provider in the whole app, you put true wen call the provider in the build method
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'Categorias',
                style: CustomLabels.h1,
              ),
              const SizedBox(height: 10),
              PaginatedDataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Categoria')),
                  DataColumn(label: Text('Creado po')),
                  DataColumn(label: Text('Acciones')),
                ],
                source: CategoriesDTS(categorias, context),
                header: const Text(
                    'Esta es una lista de las categorias disponibles'),
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                rowsPerPage: _rowsPerPage,
                actions: [
                  CustomIconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => const CategoryModal(
                                  categoria:
                                      null, // null because we are creating a new category and not editing one, this parameter is optional
                                ));
                      },
                      tooltip: 'Create',
                      icon: Icons.add_outlined,
                      color: Colors.black),
                ],
              ),
            ]));
  }
}

//This is a template for the dashboard layout view
