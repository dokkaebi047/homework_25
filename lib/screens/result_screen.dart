import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String playerChoice;
  final String opponentChoice;
  final String result;

  const ResultScreen({
    super.key,
    required this.playerChoice,
    required this.opponentChoice,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Результат')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ваш выбор: $playerChoice',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Выбор противника: $opponentChoice',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: result == 'Вы победили'
                    ? Colors.green
                    : (result == 'Вы проиграли' ? Colors.red : Colors.orange),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Играть снова'),
            ),
          ],
        ),
      ),
    );
  }
}
