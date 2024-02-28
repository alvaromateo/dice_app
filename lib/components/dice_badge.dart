import 'package:flutter/material.dart';
import '../color_schemes.dart';

class DiceBadge extends StatelessWidget {
  final int number;

  const DiceBadge(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color(context).onSecondary,
      ),
      child: Text(number.toString()),
    );
  }
}
