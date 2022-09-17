import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({Key? key, this.categoria}) : super(key: key);
  final Categoria? categoria;

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 500,
      width: 500, // by default is the same as the screen
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.categoria?.nombre ?? 'Nueva categoria',
              style: CustomLabels.h1.copyWith(color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white.withOpacity(0.3),
                ))
          ]),
          Divider(color: Colors.white),
          SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) =>
                nombre = value, // update the value of the input
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre de la categoria',
                label: 'Categoria',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                if (id == null) {
                  // create
                  await categoryProvider
                      .newCategory(nombre); // this is to create a new category
                } else {
                  // update

                  await categoryProvider.updateCategory(
                      id!, nombre); // this is to update a category
                }

                Navigator.of(context).pop();
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff0F2041),
        boxShadow: [
          BoxShadow(color: Colors.black26), // changes position of shadow
        ],
      );
}
