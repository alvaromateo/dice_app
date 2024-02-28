import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:math';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(const DiceInitial()) {
    on<DiceReset>(_onReset);
    on<DiceConfigured>(_onConfigured);
    on<DiceRoll>(_onRoll);
  }

  void _onReset(DiceReset event, Emitter<DiceState> emitter) {
    // todo
  }

  void _onConfigured(DiceConfigured event, Emitter<DiceState> emitter) {
    // todo
  }

  void _onRoll(DiceRoll event, Emitter<DiceState> emitter) {
    // todo
  }
}
