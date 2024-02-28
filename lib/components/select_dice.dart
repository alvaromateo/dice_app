import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../strings.dart';
import 'title.dart' as dice_app;

class SelectDice extends StatefulWidget {
  const SelectDice({super.key});

  @override
  State<SelectDice> createState() {
    return _SelectDiceState();
  }
}

class _SelectDiceState extends State<SelectDice> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const dice_app.Title(text: selectDiceTitle),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  key: const ValueKey('select_dice_number'),
                  name: 'diceNum',
                  decoration: const InputDecoration(
                    labelText: 'Number of dice',
                  ),
                  initialValue: '1',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    // todo
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  key: const ValueKey('select_dice_faces'),
                  name: 'diceFaces',
                  decoration: const InputDecoration(
                    labelText: 'Faces for each dice',
                  ),
                  initialValue: '6',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    // todo
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
