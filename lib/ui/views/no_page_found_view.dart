import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
            // Is more flexible to show content
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                'No page found',
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                'The page you are looking for does not exist',
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ]));
  }
}
