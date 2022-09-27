import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.07 : null,
      child: Wrap(
        alignment: WrapAlignment.center, // center the children
        children: [
          //TODO: add links and create a widget for each link
          LinkText(text: 'About', onPressed: () => print('About')),
          LinkText(text: 'Help Center', onPressed: () => print('Help ')),
          LinkText(text: 'Terms of service', onPressed: () => print('Terms ')),
          LinkText(text: 'Privacy Policy', onPressed: () => print('Privacy ')),
          LinkText(text: 'Ads info', onPressed: () => print('Ads ')),
          LinkText(text: 'Blog', onPressed: () => print('Blog')),
          LinkText(text: 'Status', onPressed: () => print('Status')),
          LinkText(text: 'Careers', onPressed: () => print('Careers')),
          LinkText(text: 'Businesses', onPressed: () => print('Businesses')),
        ],
      ),
    );
  }
}
