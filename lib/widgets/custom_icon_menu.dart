import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customMenuIcon(String image, String title, String subtitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 10),
      Image.asset(
        image,
        width: 42,
      ),
      SizedBox(height: 5),
      Text(
        title,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
      Text(
        subtitle,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w600)),
      ),
      SizedBox(height: 5),
    ],
  );
}
