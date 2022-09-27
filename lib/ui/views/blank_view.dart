import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'Blank view',
                style: CustomLabels.h1,
              ),
              const SizedBox(height: 10),
              const WhiteCard(
                title: 'Sales statics',
                child: Text('Hola Mundo'),
              )
            ]));
  }
}

//This is a template for the dashboard layout view
