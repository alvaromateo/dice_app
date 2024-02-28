import 'package:flutter/material.dart';
import '../color_schemes.dart';

class Title extends StatelessWidget {
  final String text;
  final double fontSize;
  final double letterSpacing;

  const Title({
    super.key,
    required this.text,
    this.fontSize = 40,
    this.letterSpacing = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color(context).onBackground,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
        ));
  }
}
