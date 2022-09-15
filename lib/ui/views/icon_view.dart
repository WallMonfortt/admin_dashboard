import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class IconView extends StatelessWidget {
  const IconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                'Icons view',
                style: CustomLabels.h1,
              ),
              SizedBox(height: 10),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                children: [
                  WhiteCard(
                      title: 'ac_unit_outlined',
                      child: Center(
                        child: Icon(Icons.ac_unit_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'access_alarm_outlined',
                      child: Center(
                        child: Icon(Icons.access_alarm_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'access_alarms_outlined',
                      child: Center(
                        child: Icon(Icons.access_alarms_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'safety_check_outlined',
                      child: Center(
                        child: Icon(Icons.safety_check_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'javascript_outlined',
                      child: Center(
                        child: Icon(Icons.javascript_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'face_retouching_natural_outlined',
                      child: Center(
                        child: Icon(Icons.face_retouching_natural_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'padding_outlined',
                      child: Center(
                        child: Icon(Icons.padding_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'u_turn_left_outlined',
                      child: Center(
                        child: Icon(Icons.u_turn_left_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'yard_outlined',
                      child: Center(
                        child: Icon(Icons.yard_outlined),
                      ),
                      width: 170),
                  WhiteCard(
                      title: 'web_asset_outlined',
                      child: Center(
                        child: Icon(Icons.web_asset_outlined),
                      ),
                      width: 170),
                ],
              )
            ]));
  }
}

//This is a template for the dashboard layout view
