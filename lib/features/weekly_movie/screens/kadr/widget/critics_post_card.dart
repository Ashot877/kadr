import 'package:flutter/material.dart';
import 'package:kadr/utils/helpers/helpers.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'details.dart';

/// Карточка поста, теперь открывает экран деталей при клике
class CriticPostCard extends StatelessWidget {
  final String username;
  final String userAvatar;
  final String movieTitle;
  final String content;
  final String? imageUrl;
  final int likes;
  final double rating; // оценка от 0 до 10
  final String kadrLogo; // путь к логотипу Kadr

  const CriticPostCard({
    super.key,
    required this.username,
    required this.userAvatar,
    required this.movieTitle,
    required this.content,
    this.imageUrl,
    this.likes = 0,
    required this.rating,
    required this.kadrLogo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CriticDetailScreen(
              username: username,
              userAvatar: userAvatar,
              movieTitle: movieTitle,
              content: content,
              imageUrl: imageUrl,
              likes: likes,
              rating: rating,
              kadrLogo: kadrLogo,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwItems / 2,
          horizontal: TSizes.defaultSpace,
        ),
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        decoration: BoxDecoration(
          color: THelperFunctions.isDarkMode(context) ? theme.cardColor : TColor.lightBack,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Header (аватар и имя) ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userAvatar),
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'About: $movieTitle',
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// --- Content text с ограничением 3 строк ---
            Text(
              content,
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            if (imageUrl != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            const SizedBox(height: 12),

            /// --- My rating (оценка снизу) ---
            Text(
              'My rating:',
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Image.asset(
                  kadrLogo,
                  width: 11,
                  height: 11,
                ),
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

            /// --- Likes внизу справа ---
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$likes',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 7),
                    Icon(Icons.favorite_border, color: Colors.pink.shade400, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}