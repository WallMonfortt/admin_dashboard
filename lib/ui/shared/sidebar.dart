import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buidBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: const [
          Logo(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  BoxDecoration buidBoxDecoration() => const BoxDecoration(
          // This is the sidebar decoration with the gradient background
          gradient: LinearGradient(colors: [
            Color(0xff092044),
            Color(0xff092042),
          ]),
          boxShadow: [
            BoxShadow(
              // This is the left side shadow
              color: Colors.black26,
              blurRadius: 10,
            )
          ]);
}
