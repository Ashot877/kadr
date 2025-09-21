import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/weekly_movie/screens/product_details_page/product_detail_page.dart';

class TProductCardHorizontal extends StatelessWidget {
  final String title;
  final String brand;
  final String imageUrl;
  final String price;
  final int requiredCoins;
  final int userCoins;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;

  const TProductCardHorizontal({
    super.key,
    required this.title,
    required this.brand,
    required this.imageUrl,
    required this.price,
    required this.requiredCoins,
    required this.userCoins,
    this.onTap,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    // Цвета и тема
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDarkMode ? Colors.grey[850] : Colors.white;
    final titleColor = isDarkMode ? Colors.white : Colors.black87;
    final subtitleColor = isDarkMode ? Colors.grey[400] : Colors.grey[600];
    final priceColor = isDarkMode ? Colors.white : Colors.black87;

    final bool canBuy = userCoins >= requiredCoins;
    final double progress = (requiredCoins <= 0)
        ? 1.0
        : (userCoins / requiredCoins).clamp(0.0, 1.0);

    final borderColor = Colors.transparent;
    final boxShadow = canBuy
        ? [
      BoxShadow(
        color: Colors.amber.withValues(alpha: 0.12),
        blurRadius: 12,
        offset: const Offset(0, 6),
      )
    ]
        : [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: const Offset(0, 3),
      )
    ];

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsPage(title: title, imageUrl: imageUrl, price: price, requiredCoins: requiredCoins, userCoins: userCoins,)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: canBuy ? 2 : 0),
          boxShadow: boxShadow,
        ),
        child: Row(
          children: [
            // Thumbnail
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[600],
                          size: 28,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: titleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),

                        // Brand
                        Text(
                          brand,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: subtitleColor, fontSize: 8),
                        ),
                        const SizedBox(height: 2),

                        // Progress bar
                        SizedBox(
                          height: 8,
                          width: double.infinity,
                          child: LayoutBuilder(builder: (_, constraints) {
                            final fullW = constraints.maxWidth;
                            return Stack(
                              children: [
                                Container(
                                  width: fullW,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withValues(alpha: 0.25),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: fullW * progress,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade400,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),

                        // Coins label
                        Row(
                          children: [
                            Text(
                              '$userCoins / $requiredCoins',
                              style: TextStyle(
                                color: canBuy
                                    ? Colors.amber.shade700
                                    : subtitleColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
                              ),
                            ),
                            const SizedBox(width: 7),
                            if (canBuy)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade700.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Available',
                                  style: TextStyle(
                                    color: Colors.amber.shade800,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),

                    // Price + Add button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            color: priceColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: canBuy ? onAdd : null,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: canBuy
                                  ? Colors.green.shade600
                                  : isDarkMode
                                  ? Colors.grey.withValues(alpha: 0.3)
                                  : Colors.grey.shade400.withValues(alpha: 0.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Icon(
                              canBuy
                                  ? Icons.check_circle
                                  : Icons.lock,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
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
