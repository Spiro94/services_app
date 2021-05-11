import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/core/widgets/tokens.dart';

class MainText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const MainText(
    this.text, {
    this.size,
    this.color,
    this.fontWeight,
    this.textAlign,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: color ?? primaryColor,
        fontSize: size ?? 20,
        fontWeight: fontWeight,
      ),
    );
  }
}
