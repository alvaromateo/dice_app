part of 'dice_bloc.dart';

@immutable
sealed class DiceEvent {
  final int? diceNum;
  final int? diceFaces;

  const DiceEvent({this.diceNum, this.diceFaces});
}

final class DiceReset extends DiceEvent {
  const DiceReset({super.diceNum, super.diceFaces});
}

final class DiceConfigured extends DiceEvent {
  const DiceConfigured({super.diceNum, super.diceFaces});
}

final class DiceRoll extends DiceEvent {
  const DiceRoll({super.diceNum, super.diceFaces});
}
