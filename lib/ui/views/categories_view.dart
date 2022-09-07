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
          WhiteCard(
            title: 'categorias title',
            child: Text('Hola Mundo'),
          )
        ]));
  }
}

//This is a template for the dashboard layout view
