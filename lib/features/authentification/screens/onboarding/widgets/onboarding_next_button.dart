import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/controllers_onboardin/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Obx(() {
      // Проверяем, последняя ли страница для смены внешнего вида кнопки
      final isLastPage = controller.currentPageIndex.value == 2;

      return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtility.getBottomNavigationBarHeight(),
        child: isLastPage
            ? ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(
            backgroundColor: TColor.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            TTexts.lastOnBoarding,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
            ),
          ),
        )
            : ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: TColor.primaryColor,
          ),
          child: const Icon(Iconsax.arrow_right_3, color: Colors.black),
        ),
      );
    });
  }
}
