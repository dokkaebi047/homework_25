import 'dart:math';

class GameLogic {
  static const List<String> choices = ['Камень', 'Ножницы', 'Бумага'];

  static String generateOpponentChoice() {
    return choices[Random().nextInt(choices.length)];
  }

  static String determineResult(String playerChoice, String opponentChoice) {
    if (playerChoice == opponentChoice) return 'Ничья';
    if ((playerChoice == 'Камень' && opponentChoice == 'Ножницы') ||
        (playerChoice == 'Ножницы' && opponentChoice == 'Бумага') ||
        (playerChoice == 'Бумага' && opponentChoice == 'Камень')) {
      return 'Вы победили';
    }
    return 'Вы проиграли';
  }
}
