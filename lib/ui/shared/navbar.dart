import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buidlBoxDecoration(),
      child: Row(
        children: [
          // TODO: Menu icon
          IconButton(onPressed: () => {}, icon: Icon(Icons.menu_outlined)),
          SizedBox(
            width: 5,
          ),
          //Search input
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          ),

          Spacer(),

          NotificationsIndicator(),

          SizedBox(
            width: 10,
          ),

          NavbarAvatar(),

          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration buidlBoxDecoration() => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 10),
          ),
        ],
      );
}