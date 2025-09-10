import 'package:flutter/material.dart';
import 'package:kadr/features/authentification/controllers_onboardin/onboarding_controller.dart';
import 'package:kadr/utils/helpers/helpers.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtility.getAppBarHeight(),
      right: TSizes.defaultSpace - 10,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: Text(
          'Skip',
          style: TextStyle(
            color: THelperFunctions.isDarkMode(context)
                ? Color(0xFFE2E2E2)
                : Color(0xFF202020),
          ),
        ),
      ),
    );
  }
}
