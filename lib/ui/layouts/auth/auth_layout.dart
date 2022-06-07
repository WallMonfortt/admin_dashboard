// Master page para la parte de la autenticacion
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Desktop
          _DesktopBody(),
          // mobile
          // linksbar
        ]
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      // this is necessary because is a child of a list view
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(children: [
        // Twitter background
        Expanded(
          child: Container(
            color:Colors.blue,
          ),
        ),
        // View container
        Container(
          width: 600,
          height: double.infinity,
          color: Colors.black,
        )
      ],)
    );
  }
}
