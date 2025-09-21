import 'package:flutter/material.dart';
import 'package:kadr/features/weekly_movie/screens/rewards/section/widgets/carusel.dart';
import 'package:kadr/utils/helpers/helpers.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/product_card/product_card_horizontal.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MarketTab extends StatelessWidget {
  const MarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'One-Month Netflix Subscription',
        'image': TImages.product1,
        'brand': 'Netflix',
        'price': '3000',
      },
      {
        'title': '2 Movie Tickets Cinema Star',
        'image': TImages.product2,
        'brand': 'Cinema Star',
        'price': '2000',
      },
      {
        'title': 'One-Month Apple TV Subscription',
        'image': TImages.product3,
        'brand': 'Apple TV',
        'price': '3000',
      },
    ];

    final banners = [
      TImages.banner,
      TImages.banner2,
      TImages.banner3,
    ];
    final cardBg = THelperFunctions.isDarkMode(context) ? Colors.grey[850] : Colors.white;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: TSizes.defaultSpace),
          children: [
            /// Баннеры на всю ширину
            SizedBox(
              height: 200,
              child: BannerCarousel(banners: banners),
            ),
            const SizedBox(height: TSizes.spaceBtwItems * 2),

            /// Остальной контент с horizontal padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Main Items Section
                  const TSectionHeading(title: 'Items:', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ...items.map(
                        (it) => Padding(
                      padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems / 2),
                      child: SizedBox(
                        height: 120,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TProductCardHorizontal(
                              title: it['title']!,
                              imageUrl: it['image']!,
                              brand: it['brand']!,
                              price: it['price']!,
                              requiredCoins: 3000,
                              userCoins: 2000,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            // Внутри ListView, после всех карточек
            // Внутри ListView, после всех карточек
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardBg, // тот же фон, что и у карточек
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How to earn points?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("• ", style: TextStyle(fontSize: 13, color: Colors.grey)),
                            Expanded(
                              child: Text(
                                "Write reviews: +10 points",
                                style: TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("• ", style: TextStyle(fontSize: 13, color: Colors.grey)),
                            Expanded(
                              child: Text(
                                "Share with friends: +5 points",
                                style: TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("• ", style: TextStyle(fontSize: 13, color: Colors.grey)),
                            Expanded(
                              child: Text(
                                "Daily login: +2 points",
                                style: TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
