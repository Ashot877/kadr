import 'package:flutter/material.dart';
import 'package:kadr/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:kadr/utils/constants/sizes.dart';
import 'package:kadr/utils/helpers/helpers.dart';
import '../../../../utils/constants/colors.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final int requiredCoins;
  final int userCoins;

  const ProductDetailsPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.requiredCoins,
    required this.userCoins,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final bool canBuy = userCoins >= requiredCoins;
    final double progress =
    (requiredCoins <= 0) ? 1.0 : (userCoins / requiredCoins).clamp(0.0, 1.0);

    final titleColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.white70 : Colors.black54;
    final priceColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80), // место для sticky bottom
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Product Image без отступов
                TCurvedEdgesWidget(
                  child: Container(
                    color: isDark ? TColor.darkGreyText : TColor.lightGreyText,
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      const SizedBox(height: 6),

                      /// Price
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: priceColor,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Description
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "Suspendisse varius enim in eros elementum tristique. "
                            "Duis cursus, mi quis viverra ornare, eros dolor interdum nulla, "
                            "ut commodo diam libero vitae erat.",
                        style: TextStyle(
                          fontSize: 14,
                          color: subtitleColor,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Coins + Progress bar
                      Text(
                        'Your coins: $userCoins / $requiredCoins',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: canBuy ? Colors.amber.shade700 : subtitleColor,
                        ),
                      ),
                      const SizedBox(height: 6),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          backgroundColor: Colors.grey.withOpacity(0.25),
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.amber.shade400),
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Available badge
                      if (canBuy)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade700.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.amber.shade800,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                      const SizedBox(height: 50), // чтобы контент не ушёл за sticky
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Sticky bottom action
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: isDark ? Colors.grey[900] : Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        canBuy ? Colors.green.shade600 : Colors.grey.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: canBuy ? () {} : null,
                      child: Text(
                        canBuy ? 'Buy Now' : 'Not Enough Coins',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      color: canBuy ? Colors.white : Colors.grey.shade300,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
