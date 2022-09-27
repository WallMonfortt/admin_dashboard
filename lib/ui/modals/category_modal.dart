import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          const Divider(color: Colors.white),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) =>
                nombre = value, // update the value of the input
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre de la categoria',
                label: 'Categoria',
                icon: Icons.new_releases_outlined),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    // create
                    await categoryProvider.newCategory(
                        nombre); // this is to create a new category
                    NotificationService.showSnackbarSuccess(
                        'Categoria $nombre creada');
                  } else {
                    // update

                    await categoryProvider.updateCategory(
                        id!, nombre); // this is to update a category
                    NotificationService.showSnackbarSuccess(
                        'Categoria $id actualizada');
                  }
                } catch (e) {
                  NotificationService.showSnackbarError(e.toString());
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

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff0F2041),
        boxShadow: [
          BoxShadow(color: Colors.black26), // changes position of shadow
        ],
      );
}
