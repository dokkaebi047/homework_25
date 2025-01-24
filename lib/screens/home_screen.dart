import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Камень-Ножницы-Бумага'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Пока ничего не делаем, это будет реализовано позже
          },
          child: const Text('Начать'),
        ),
      ),
    );
  }
}
