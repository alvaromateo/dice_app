import 'package:flutter/material.dart';

import '../color_schemes.dart';

import 'package:dice_app/components/results.dart';
import 'package:dice_app/components/select_dice.dart';
import 'package:dice_app/components/splash.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget content;

  const ScaffoldWrapper(this.content, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color(context).background,
      body: content,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch (content.runtimeType) {
            case SelectDice:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const ScaffoldWrapper(Results())));
            case Results:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const ScaffoldWrapper(SelectDice())));
            case Splash:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const ScaffoldWrapper(SelectDice())));
            default:
            // do nothing
          }
        },
        tooltip: 'Roll',
        child: switch (content.runtimeType) {
          SelectDice => const Icon(Icons.casino),
          Results => const Icon(Icons.redo),
          Splash => const Icon(Icons.arrow_forward),
          // we should not reach this point
          _ => throw Error()
        },
      ),
    );
  }
}
