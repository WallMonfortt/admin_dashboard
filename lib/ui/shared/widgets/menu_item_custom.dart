import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemCustom extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;
  const MenuItemCustom({
    Key? key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MenuItemCustom> createState() => _MenuItemCustomState();
}

class _MenuItemCustomState extends State<MenuItemCustom> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: isHovered
            ? Colors.black.withOpacity(0.1)
            : widget.isActive
                ? Colors.black.withOpacity(0.3)
                : Colors.transparent, //This the color for the active menu item
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.isActive
                ? null
                : () => widget
                    .onPressed(), // This is the onTap function for the menu item if it is not active
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.text,
                      style: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
