import 'package:flutter/material.dart';
import 'package:kadr/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:kadr/utils/constants/colors.dart';
import 'package:kadr/utils/constants/sizes.dart';
import 'package:kadr/utils/helpers/helpers.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String bannerUrl;
  final bool isDark;

  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.bannerUrl,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = isDark || THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Banner ---
            TCurvedEdgesWidget(
              child: Container(
                width: double.infinity,
                height: 300,
                color: darkMode ? TColor.darkGreyText : TColor.lightGreyText,
                child: Image.asset(
                  bannerUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// --- Movie title ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// --- Information table ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: [
                  _buildTableRow('IMDB:', '⭐ 9.2/10', darkMode),
                  _buildTableRow('Kinopoisk:', '🎬 8.9/10', darkMode),
                  _buildTableRow('Rotten Tomatoes:', '🔥 97%', darkMode),
                  const TableRow(children: [SizedBox(height: 15), SizedBox(height: 15)]),
                  _buildTableRow('Year:', '1972', darkMode),
                  _buildTableRow('Genre:', 'Crime, Drama', darkMode),
                  _buildTableRow('Director:', 'Francis Ford Coppola', darkMode),
                  _buildTableRow('Duration:', '2h 55min', darkMode),
                  _buildTableRow('Language:', 'English', darkMode),
                  _buildTableRow('Cast:', 'Marlon Brando, Al Pacino, James Caan, Diane Keaton, Robert Duvall', darkMode),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// --- Why watch this movie ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why watch this movie?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This classic masterpiece is widely regarded as one of the greatest films of all time. '
                        'It explores deep themes of family, power, and betrayal with brilliant performances '
                        'and a timeless story that captivates audiences even today.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: darkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String key, String value, bool dark) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 5),
          child: Text(
            key,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: dark ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            value,
            style: TextStyle(
              color: dark ? Colors.grey[300] : Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
