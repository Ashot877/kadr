import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers.dart';

class CriticDetailScreen extends StatelessWidget {
  final String username;
  final String userAvatar;
  final String movieTitle;
  final String content;
  final String? imageUrl;
  final int likes;
  final double rating;
  final String kadrLogo;

  const CriticDetailScreen({
    super.key,
    required this.username,
    required this.userAvatar,
    required this.movieTitle,
    required this.content,
    this.imageUrl,
    required this.likes,
    required this.rating,
    required this.kadrLogo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1,
        iconTheme: IconThemeData(
          color: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
        ),
        //title: Text(username, style: theme.textTheme.titleMedium),
      ),
      backgroundColor: THelperFunctions.isDarkMode(context) ? theme.cardColor : TColor.lightBack,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userAvatar),
                  radius: 28,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text('About: $movieTitle', style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Полный текст
            Text(content, style: theme.textTheme.bodyMedium!.copyWith(height: 1.4)),

            if (imageUrl != null) ...[
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imageUrl!, fit: BoxFit.cover),
              ),
            ],

            const SizedBox(height: 16),
            // Rating
            Text('My rating:', style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400)),
            const SizedBox(height: 4),
            Row(
              children: [
                Image.asset(kadrLogo, width: 11, height: 11),
                const SizedBox(width: 6),
                Text(
                  '${rating.toStringAsFixed(1)}/10',
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            // Likes
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$likes', style: theme.textTheme.bodyMedium),
                const SizedBox(width: 7),
                Icon(Icons.favorite_border, color: Colors.pink.shade400, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
