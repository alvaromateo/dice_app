part of 'dice_bloc.dart';

@immutable
sealed class DiceEvent {
  const DiceEvent();
}

final class DiceReset extends DiceEvent {
  const DiceReset();
}

final class DiceConfigured extends DiceEvent {
  final int diceNum;
  final int diceFaces;

  const DiceConfigured(this.diceNum, this.diceFaces);
}

final class DiceRoll extends DiceEvent {
  const DiceRoll();
}
