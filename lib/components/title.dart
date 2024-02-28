import 'package:flutter/material.dart';
import '../color_schemes.dart';

class Title extends StatelessWidget {
  final String text;

  const Title({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color(context).onBackground,
          fontSize: 40,
          letterSpacing: 5,
        ));
  }
}
