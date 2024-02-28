import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:math';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(const DiceNotStarted()) {
    on<DiceReset>(_onReset);
    on<DiceConfigured>(_onConfigured);
    on<DiceRoll>(_onRoll);
  }

  void _onReset(DiceReset event, Emitter<DiceState> emitter) {
    emitter(DiceInitial(
      number: event.diceNum ?? _kDefaultDiceNumber,
      faces: event.diceFaces ?? _kDefaultDiceFaces,
    ));
  }

  void _onConfigured(DiceConfigured event, Emitter<DiceState> emitter) {
    emitter(DiceInitial(
      number: event.diceNum ?? _kDefaultDiceNumber,
      faces: event.diceFaces ?? _kDefaultDiceFaces,
    ));
  }

  void _onRoll(DiceRoll event, Emitter<DiceState> emitter) {
    // the values should be validated by the form
    emitter(DiceThrowResult(
      diceNum: event.diceNum!,
      diceFaces: event.diceFaces!,
    ));
  }
}
