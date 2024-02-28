import 'package:dice_app/bloc/dice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../color_schemes.dart';

import 'package:dice_app/components/results.dart';
import 'package:dice_app/components/select_dice.dart';
import 'package:dice_app/components/splash.dart';

const splashScreen = Splash();
const resultsScreen = Results();
final selectDiceScreen = SelectDice();

class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiceBloc(),
      child: BlocBuilder<DiceBloc, DiceState>(
        builder: (context, state) => Scaffold(
          backgroundColor: color(context).background,
          body: switch (state) {
            DiceNotStarted() => splashScreen,
            DiceInitial() => selectDiceScreen,
            DiceThrowResult() => resultsScreen,
          },
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              switch (state) {
                case DiceInitial():
                  if (selectDiceScreen.isFormValid()) {
                    // means the values are valid
                    // so we can get them from the state
                    context.read<DiceBloc>().add(DiceRoll(
                          diceNum: state.diceNum,
                          diceFaces: state.diceFaces,
                        ));
                  }
                case DiceThrowResult():
                  context.read<DiceBloc>().add(DiceReset(
                        diceNum: state.diceNum,
                        diceFaces: state.diceFaces,
                      ));
                case DiceNotStarted():
                  context.read<DiceBloc>().add(const DiceReset());
              }
            },
            tooltip: 'Roll',
            child: switch (state) {
              DiceInitial() => const Icon(Icons.casino),
              DiceThrowResult() => const Icon(Icons.redo),
              DiceNotStarted() => const Icon(Icons.arrow_forward),
            },
          ),
        ),
      ),
    );
  }
}
