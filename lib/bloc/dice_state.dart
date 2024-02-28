part of 'dice_bloc.dart';

const _kDefaultDiceFaces = 6;
const _kDefaultDiceNumber = 1;
final _randomNumberGenerator = Random();

@immutable
sealed class DiceState extends Equatable {
  final int diceNum;
  final int diceFaces;

  const DiceState({required this.diceNum, required this.diceFaces});

  @override
  List<Object> get props => [diceNum, diceFaces];
}

final class DiceInitial extends DiceState {
  const DiceInitial(
      {super.diceNum = _kDefaultDiceNumber,
      super.diceFaces = _kDefaultDiceFaces});
}

final class DiceThrowResult extends DiceState {
  final Map<int, int> results;

  DiceThrowResult({required super.diceNum, required super.diceFaces})
      : results = _generateDiceResults(diceNum, diceFaces);
}

Map<int, int> _generateDiceResults(int diceNum, int diceFaces) {
  Map<int, int> results = {};
  for (final _ in List.generate(diceNum, (i) => i)) {
    final dieThrow = _randomNumberGenerator.nextInt(diceFaces) + 1;
    results[dieThrow] = results[dieThrow] != null ? results[dieThrow]! + 1 : 1;
  }
  return results;
}
