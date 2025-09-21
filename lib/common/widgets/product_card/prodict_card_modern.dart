import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../features/weekly_movie/screens/product_details_page/product_detail_page.dart';

class TProductCardModern extends StatelessWidget {
  final String title;
  final String brand;
  final String imageUrl;
  final String price;
  final int requiredCoins;
  final int userCoins;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;

  const TProductCardModern({
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final canBuy = userCoins >= requiredCoins;
    final bg = isDark ? Colors.grey[850] : Colors.white;
    final border = canBuy ? Colors.amber.shade700 : Colors.transparent;

    return InkWell(
      onTap: onTap ?? () => Get.to(() => ProductDetailsPage(title: title, imageUrl: imageUrl, price: price, requiredCoins: requiredCoins, userCoins: userCoins)),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border, width: canBuy ? 1.8 : 0),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3))],
        ),
        child: Row(
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TRoundedImage(
                width: 90, height: 90, imageUrl: imageUrl, fit: BoxFit.cover, applyImageRadius: false,
              ),
            ),
            const SizedBox(width: 12),

            // text + progress
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title + price chip
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: canBuy ? Colors.green.shade600 : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(brand, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  const SizedBox(height: 8),

                  // thin progress
                  LayoutBuilder(
                      builder: (_, constr) {
                        final prog = requiredCoins == 0 ? 1.0 : (userCoins / requiredCoins).clamp(0.0, 1.0);
                        return Stack(
                          children: [
                            Container(
                              height: 6,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.25), borderRadius: BorderRadius.circular(6)),
                            ),
                            Container(
                              height: 6,
                              width: constr.maxWidth * prog,
                              decoration: BoxDecoration(color: Colors.amber.shade400, borderRadius: BorderRadius.circular(6)),
                            ),
                          ],
                        );
                      }
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // action icon
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(canBuy ? Icons.check_circle : Icons.lock, color: canBuy ? Colors.amber.shade700 : Colors.grey, size: 18),
                GestureDetector(
                  onTap: canBuy ? onAdd : null,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: canBuy ? Colors.green.shade600 : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(canBuy ? Icons.add_shopping_cart : Icons.remove_shopping_cart, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
