import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'game_logic.dart'; // Подключаем логику игры

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Камень-Ножницы-Бумага')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Выберите свой ход:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChoiceButton(
                  context,
                  'Камень',
                  'assets/rock.png',
                ),
                _buildChoiceButton(
                  context,
                  'Ножницы',
                  'assets/scissors.png',
                ),
                _buildChoiceButton(
                  context,
                  'Бумага',
                  'assets/paper.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceButton(BuildContext context, String choice, String image) {
    return GestureDetector(
      onTap: () {
        // Получаем выбор противника и результат через GameLogic
        String opponentChoice = GameLogic.generateOpponentChoice();
        String result = GameLogic.determineResult(choice, opponentChoice);

        // Переходим на экран с результатами
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              playerChoice: choice,
              opponentChoice: opponentChoice,
              result: result,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(image, height: 100, width: 100),
          Text(choice),
        ],
      ),
    );
  }
}
