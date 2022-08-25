import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item_custom.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider =
        Provider.of<SideMenuProvider>(context); // side menu provider
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buidBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          TextSeparator(
              // This is a generic widget, in this case shows the text 'main'
              text: 'main'),
          MenuItemCustom(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItemCustom(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            onPressed: () => {},
          ),
          MenuItemCustom(
            text: 'Analitic',
            icon: Icons.show_chart_outlined,
            onPressed: () => {},
          ),
          MenuItemCustom(
            text: 'Categories',
            icon: Icons.layers_outlined,
            onPressed: () {},
          ),
          MenuItemCustom(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            onPressed: () => {},
          ),
          MenuItemCustom(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            onPressed: () => {},
          ),
          MenuItemCustom(
            text: 'Customers',
            icon: Icons.people_alt_outlined,
            onPressed: () => {},
          ),
          SizedBox(
            height: 30,
          ),
          TextSeparator(
              // This is a generic widget, in this case shows the text 'Ui elements'
              text: 'UI Elements'),
          MenuItemCustom(
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
          MenuItemCustom(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () => {},
          ),
          MenuItemCustom(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            onPressed: () => {},
          ),
          MenuItemCustom(
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            text: 'Black',
            icon: Icons.post_add_outlined,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
          ),
          SizedBox(
            height: 50,
          ),
          TextSeparator(
              // This is a generic widget, in this case shows the text 'Exit'
              text: 'Exit'),
          MenuItemCustom(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () => {},
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
