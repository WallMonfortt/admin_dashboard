// Master page para la parte de la autenticacion
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      // Desktop
      _DesktopBody( child: child),
      // mobile
      // linksbar
    ]));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // this is necessary because is a child of a list view
        width: size.width,
        height: size.height,
        color: Colors.red,
        child: Row(
          children: [
            // Twitter background
            BackgroundTwitter(),
            // View container
            Container(
              width: 600,
              height: double.infinity,
              color: Colors.black,
              child: Column(children: [
                SizedBox(height: 10),
                CustomTitleWidget(),
                SizedBox(
                  height: 50,
                ),
                Expanded( child: child,),
              ]),
            )
          ],
        ));
  }
}
