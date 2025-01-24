import 'dart:math';
import 'package:flutter/material.dart';
import 'result_screen.dart';

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
        String opponentChoice = _generateRandomChoice();
        String result = _getGameResult(choice, opponentChoice);
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

  String _generateRandomChoice() {
    final choices = ['Камень', 'Ножницы', 'Бумага'];
    return choices[Random().nextInt(3)];
  }

  String _getGameResult(String player, String opponent) {
    if (player == opponent) return 'Ничья';
    if ((player == 'Камень' && opponent == 'Ножницы') ||
        (player == 'Ножницы' && opponent == 'Бумага') ||
        (player == 'Бумага' && opponent == 'Камень')) {
      return 'Вы победили';
    }
    return 'Вы проиграли';
  }
}
