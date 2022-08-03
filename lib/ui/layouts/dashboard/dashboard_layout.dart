import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                //TODO: Its depends if it is more than 700px
                if (size.width >= 700) Sidebar(),

                Expanded(
                  child: Column(children: [
                    //Navbar
                    Navbar(),
                    Expanded(
                      child: child,
                    ),
                  ]),
                )

                // This is the main content of the dashboard
              ],
            ),
            if (size.width < 700) Sidebar(),
          ],
        ));
  }
}
