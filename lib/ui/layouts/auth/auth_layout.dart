// Master page para la parte de la autenticacion
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Scrollbar(
      child: ListView(physics: const ClampingScrollPhysics(), children: [
        (size.width > 1000)
            ? // Desktop
            _DesktopBody(child: child)
            // mobile
            : _MobileBody(child: child),

        // linksbar
        const LinksBar(),
      ]),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 20),
        const CustomTitleWidget(),
        SizedBox(
          width: double.infinity,
          height: 420,
          child: child,
        ),
        const SizedBox(
          width: double.infinity,
          height: 400,
          child: BackgroundTwitter(),
        ),
      ]),
    );
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
        height: size.height * 0.95,
        color: Colors.black,
        child: Row(
          children: [
            // Twitter background
            const Expanded(child: BackgroundTwitter()),
            // View container
            Container(
              width: 600,
              height: double.infinity,
              color: Colors.black,
              child: Column(children: [
                const SizedBox(height: 10),
                const CustomTitleWidget(),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: child,
                ),
              ]),
            )
          ],
        ));
  }
}
