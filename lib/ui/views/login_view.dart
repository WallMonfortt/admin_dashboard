// Note: Las vistas no tienen un scaffold

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Login view')) ,
    );
  }
}