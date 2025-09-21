import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TWAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TWAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: dark ? Colors.black : Colors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Image.asset(
              dark ? TImages.appBarLogoDark : TImages.appBarLogoLight,
              height: 28,
              width: 28, // явно указываем ширину
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: TColor.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // теперь правый запас = ширине логотипа — текст реально центрируется
            const SizedBox(width: 28),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
