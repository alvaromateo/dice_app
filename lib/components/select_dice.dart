import 'package:dice_app/bloc/dice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../strings.dart';
import 'title.dart' as dice_app;

class SelectDice extends StatefulWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  SelectDice({super.key});

  @override
  State<SelectDice> createState() {
    return _SelectDiceState();
  }

  bool isFormValid() {
    FormBuilderState? formState = _formKey.currentState;
    return formState != null && formState.validate();
  }
}

class _SelectDiceState extends State<SelectDice> {
  final _required = 'Required positive number to configure the throw';

  String? _positiveNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return _required;
    }
    final numValue = int.tryParse(value);
    if (numValue == null || numValue < 1) {
      return _required;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const dice_app.Title(
            text: selectDiceTitle,
            fontSize: 30,
            letterSpacing: 1,
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<DiceBloc, DiceState>(
            builder: (context, state) {
              return FormBuilder(
                key: widget._formKey,
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: FormBuilderTextField(
                        key: const ValueKey('select_dice_number'),
                        name: 'diceNum',
                        decoration: const InputDecoration(
                          labelText: 'Number of dice',
                        ),
                        initialValue: state.diceNum.toString(),
                        keyboardType: TextInputType.number,
                        validator: _positiveNumberValidator,
                        onChanged: (value) {
                          if (value != null) {
                            final int? newDiceNum = int.tryParse(value);
                            if (newDiceNum != null) {
                              context.read<DiceBloc>().add(DiceConfigured(
                                    diceNum: newDiceNum,
                                    diceFaces: state.diceFaces,
                                  ));
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: FormBuilderTextField(
                        key: const ValueKey('select_dice_faces'),
                        name: 'diceFaces',
                        decoration: const InputDecoration(
                          labelText: 'Faces for each dice',
                        ),
                        initialValue: state.diceFaces.toString(),
                        keyboardType: TextInputType.number,
                        validator: _positiveNumberValidator,
                        onChanged: (value) {
                          if (value != null) {
                            final int? newFacesNum = int.tryParse(value);
                            if (newFacesNum != null) {
                              context.read<DiceBloc>().add(DiceReset(
                                    diceNum: state.diceNum,
                                    diceFaces: newFacesNum,
                                  ));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
