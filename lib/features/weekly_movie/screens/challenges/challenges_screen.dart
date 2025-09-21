import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Пример данных челленджей
    final List<String> challenges = [
      'Watch a comedy this week',
      'Rate your favorite movie',
      'Share a review with friends',
      'Complete a movie quiz',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Iconsax.flag), // твоя иконка для челленджей
              title: Text(challenges[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Можно добавить переход на детали челленджа
              },
            ),
          );
        },
      ),
    );
  }
}
