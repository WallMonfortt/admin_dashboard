import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
  
    return Container(
      color: Colors.black,
      height: size.height * 0.07,
      child: Wrap(
        alignment: WrapAlignment.center, // center the children
          children: [
            LinkText(text: 'About', onPressed: () => print('About')),
            LinkText(text: 'Help Center'),
            LinkText(text: 'Terms of service'),
            LinkText(text: 'Privacy Policy'),
            LinkText(text: 'Ads info'),
            LinkText(text: 'Blog'),
            LinkText(text: 'Status'),
            LinkText(text: 'Careers'),
            LinkText(text: 'Businesses'),
          ],
        ),
    );
  }
}