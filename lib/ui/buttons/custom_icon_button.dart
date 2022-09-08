import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String tooltip;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.tooltip,
    this.color = Colors.grey,
    this.isFilled = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(
            color.withOpacity(0.5),
          ),
          overlayColor: MaterialStateProperty.all(
            color.withOpacity(0.3),
          ),
        ),
        onPressed: () => onPressed,
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 5),
            Text(tooltip, style: TextStyle(color: Colors.white)),
          ],
        ));
  }
}
