import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/features/authentification/controllers_onboardin/onboarding_controller.dart';
import 'package:kadr/utils/constants/colors.dart';
import 'package:kadr/utils/constants/image_strings.dart';
import 'package:kadr/utils/constants/sizes.dart';
import 'package:kadr/utils/helpers/helpers.dart';
import 'package:kadr/utils/constants/text_strings.dart';
import 'package:kadr/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding_dot_navigation.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                isDark: isDark,
                image: isDark
                    ? TImages.onBoardingImageDark1
                    : TImages.onBoardingImageLight1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                isDark: isDark,
                image: isDark
                    ? TImages.onBoardingImageDark2
                    : TImages.onBoardingImageLight2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                isDark: isDark,
                image: isDark
                    ? TImages.onBoardingImageDark3
                    : TImages.onBoardingImageLight3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
