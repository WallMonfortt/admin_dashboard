import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  const LinkText({Key? key, required this.text, this.onPressed})
      : super(key: key);

  final String text; // the text to display
  final Function? onPressed; //? means that the function is optional

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!(); // ! means not null
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors
            .click, // change the cursor when the mouse is over the widget
        onEnter: (_) => setState(() => isHover =
            true), // set the state to true when the mouse is over the widget
        onExit: (_) => setState(() => isHover = false),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              widget.text, // the text to display
              style: TextStyle(
                color: Colors.grey[700],
                decoration: isHover
                    ? TextDecoration.underline
                    : TextDecoration
                        .none, // if the mouse is over the widget, underline the text
                fontSize: 16,
              ),
            )),
      ),
    );
  }
}
