import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helpers.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentSection;
  final List<String> tabs;
  final void Function(String section)? onSectionSelected;

  const TAppBar({
    super.key,
    required this.currentSection,
    required this.tabs,
    this.onSectionSelected,
  });

  Widget _buildTab(BuildContext context, String label, String section) {
    final isSelected = currentSection == section;
    final dark = THelperFunctions.isDarkMode(context);

    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: 18,
    );
    final textWidth = (TextPainter(
      text: TextSpan(text: label, style: textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout()).size.width;

    return GestureDetector(
      onTap: () => onSectionSelected?.call(section),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: textStyle?.copyWith(
              color: isSelected
                  ? TColor.primaryColor
                  : dark
                  ? TColor.darkGreyText
                  : TColor.lightGreyText,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: textWidth,
            color: isSelected ? TColor.primaryColor : Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Логотип слева
            Image.asset(
              dark ? TImages.appBarLogoDark : TImages.appBarLogoLight,
              height: 28,
            ),
            const SizedBox(width: 16),
            // Табы справа, равномерно распределённые
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < tabs.length; i++)
                    _buildTab(context, tabs[i], i.toString()), // индекс используем как section
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
