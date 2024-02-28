import 'package:flutter/material.dart';

import '../strings.dart';
import 'title.dart' as dice_app;

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const dice_app.Title(text: appTitle),
          SizedBox(
            width: width * 0.6,
            height: height * 0.5,
            child: Image.asset(
              'assets/dice_app_icon.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
