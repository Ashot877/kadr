import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PremierePage extends StatelessWidget {
  const PremierePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final double bannerWidth = (screenWidth - 2 * TSizes.md);
    final double bannerHeight = 400;
    final double bannerTop = 150;
    final double blurredHeight = 600;
    final double borderRadius = 20;

    final double overflow = (bannerTop + bannerHeight) - blurredHeight;
    final double reserveHeight = math.max(0.0, overflow) + TSizes.md;
    final screenHeight = MediaQuery.of(context).size.height;
    final topSectionHeight = screenHeight * 0.73;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Stack: размытый фон + баннер ---
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Размытый фон
              SizedBox(
                height: topSectionHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: Colors.black),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 1,
                        height: topSectionHeight,
                        child: ClipRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 20,
                              sigmaY: 20,
                            ),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withValues(alpha: 0.55),
                                BlendMode.darken,
                              ),
                              child: Image.asset(
                                TImages.theWeekMovie,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Название фильма
                    Positioned(
                      top: TSizes.xl,
                      left: TSizes.md,
                      right: TSizes.md,
                      child: Column(
                        children: [
                          Text(
                            'The Godfather',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: TSizes.xs),
                          Text(
                            'Movie of the Week',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.white70,
                                  letterSpacing: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Баннер с кнопкой трейлер
              Positioned(
                top: bannerTop,
                left: TSizes.xl,
                right: TSizes.xl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: SizedBox(
                    width: bannerWidth,
                    height: bannerHeight,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          TImages.theWeekMovie,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.55),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: reserveHeight),

          // --- Основной контент ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TSizes.sm),

                // Заголовок "Information"
                Text(
                  'Information',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: dark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: TSizes.lg),

                // Таблица с информацией и рейтингами
                Table(
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: [
                    _buildTableRow(context, dark, 'IMDB :', '⭐ 9.2/10'),
                    _buildTableRow(context, dark, 'Kinopoisk :', '🎬 8.9/10'),
                    _buildTableRow(context, dark, 'Tomatoes :', '🔥 97%'),
                    const TableRow(
                      children: [
                        SizedBox(height: 15), // отступ сверху/снизу
                        SizedBox(height: 15),
                      ],
                    ),
                    _buildTableRow(context, dark, 'Year :', '1972'),
                    _buildTableRow(context, dark, 'Genre :', 'Crime, Drama'),
                    _buildTableRow(
                      context,
                      dark,
                      'Director :',
                      'Francis Ford Coppola',
                    ),
                    _buildTableRow(context, dark, 'Duration :', '2h 55min'),
                    _buildTableRow(
                      context,
                      dark,
                      'Language :',
                      'English',
                      bottomPadding: TSizes.sm,
                    ),
                    _buildTableRow(
                      context,
                      dark,
                      'Cast :',
                      'Marlon Brando, Al Pacino, James Caan, Diane Keaton, Robert Duvall',
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.lg),

                // About
                Text(
                  'About',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: dark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: TSizes.sm),
                Text(
                  'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. This classic film explores themes of family, power, and betrayal, and is widely regarded as one of the greatest films of all time.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: dark ? Colors.grey[300] : Colors.grey[700],
                  ),
                ),
                const SizedBox(height: TSizes.lg),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 2 * TSizes.md,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.primaryColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      side: BorderSide.none,
                    ),
                    child: const Text(
                      'Trailer',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.lg),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(
    BuildContext context,
    bool dark,
    String key,
    String value, {
    double bottomPadding = TSizes.xs,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: bottomPadding, right: 5, left: 5),
          child: Text(
            key,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: dark ? Colors.white : Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 40),
              Expanded(
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: dark ? Colors.grey[300] : Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
