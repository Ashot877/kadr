import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.isDark,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final bool isDark;
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(height: 120),
          Image(
            width: THelperFunctions.screenWidth() * 0.7,
            height: THelperFunctions.screenHeight() * 0.3,
            image: AssetImage(image),
          ),
          const SizedBox(height: 1),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwText),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}