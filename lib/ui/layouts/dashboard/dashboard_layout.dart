import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dashboard', style: Theme.of(context).textTheme.headline4),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
