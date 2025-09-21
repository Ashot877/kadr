import 'dart:ui'; // для ImageFilter
import 'package:flutter/material.dart';
import 'package:kadr/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kadr/utils/constants/colors.dart';
import 'package:kadr/utils/constants/image_strings.dart';
import 'package:kadr/utils/constants/sizes.dart';
import '../../film_details_page/film_details.dart';
import '../widgets/media_cart.dart';
import '../widgets/send_porfm.dart';

class Top3Screen extends StatelessWidget {
  const Top3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Banner через TPrimaryHeaderContainer ---
            TPrimaryHeaderContainer(
              child: SizedBox(
                width: double.infinity,
                height: 180,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // --- Blur + dark overlay ---
                    ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: 0.55),
                            BlendMode.darken,
                          ),
                          child: Image.asset(
                            TImages.bannerTop3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // --- Text + Button ---
                    Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // --- Left text ---
                          Expanded(
                            child: Text(
                              'Submit your Top 3 picks!\n'
                                  'If your picks appear in the monthly Top 3, you earn points 🎁',
                              style: textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // --- Right button ---
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Top3SubmissionScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColor.primaryColor,
                            ),
                            child: const Text('Send'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- Контент Top 3 ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Movies ---
                  Text(
                    'Top 3 Films of this Month',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return MediaCard(
                          title: 'The Godfather',
                          imageUrl: TImages.theWeekMovie1,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MovieDetailScreen(title: 'The Godfather', bannerUrl: TImages.theWeekMovie1,),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),

                  // --- Series ---
                  Text(
                    'Top 3 Series of this Month',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return MediaCard(
                          title: 'It',
                          imageUrl: TImages.theWeekMovie,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MovieDetailScreen(title: 'It', bannerUrl: TImages.theWeekMovie,),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),

                  // --- Cartoons ---
                  Text(
                    'Top 3 Cartoons of this Month',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return MediaCard(
                          title: 'Cartoon ${index + 1}',
                          imageUrl: TImages.bannerTop3,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MovieDetailScreen(title: 'Cartoon', bannerUrl: TImages.bannerTop3,),
                              ),
                            );
                          },
                        );
                      },
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
}
