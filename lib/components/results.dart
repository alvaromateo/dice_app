import 'package:dice_app/components/dice_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dice_app/bloc/dice_bloc.dart';

import '../strings.dart';
import 'title.dart' as dice_app;

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    final topMargin = MediaQuery.of(context).viewInsets.top + 100;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: topMargin,
          ),
          const dice_app.Title(
            text: throwResults,
            fontSize: 30,
            letterSpacing: 1,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<DiceBloc, DiceState>(
            builder: (context, state) {
              if (state is DiceThrowResult && state.results.isNotEmpty) {
                final values = state.results.entries.toList();
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DiceBadge(values[index].key),
                            const SizedBox(
                              width: 25,
                            ),
                            const Icon(Icons.arrow_forward),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              values[index].value.toString(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return const Text(somethingWrong);
            },
          ),
        ],
      ),
    );
  }
}

/*
material icons:
looks_one
looks_two
looks_three
looks_four
looks_five
looks_six

*/