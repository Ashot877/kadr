import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class TopCriticCard extends StatelessWidget {
  final String avatar;
  final String nickname;
  final int score;
  final int place; // 1, 2, 3...
  final String section; // "main", "likes", "newbie"

  const TopCriticCard({
    super.key,
    required this.avatar,
    required this.nickname,
    required this.score,
    required this.place,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final isFirst = place == 1 && section == "main";

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: isFirst
            ? const LinearGradient(
          colors: [Colors.amber, Colors.orangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
        color: isFirst ? null : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(avatar),
              ),
              if (isFirst)
                const Positioned(
                  right: -4,
                  top: -4,
                  child: Icon(Icons.emoji_events,
                      color: Colors.yellow, size: 28),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isFirst ? 18 : 16,
                    color: isFirst ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '+$score баллов',
                  style: TextStyle(
                    color: isFirst ? Colors.white70 : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '#$place',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isFirst ? 18 : 16,
              color: isFirst ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
