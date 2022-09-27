import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
          width: 30,
          height: 30,
          child: Image.network(
              'data:image/jpeg;base64,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')),
    );
  }
}
