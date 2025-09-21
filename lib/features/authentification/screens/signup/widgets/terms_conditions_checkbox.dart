import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = value ?? false,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${TTexts.privacyPolicy}  ',
                style: Theme.of(context).textTheme.bodySmall!
                    .apply(
                  color: dark
                      ? Colors.white
                      : TColor.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark
                      ? Colors.white
                      : TColor.primaryColor,
                ),
              ),
              TextSpan(
                text: '${TTexts.and}  ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodySmall!
                    .apply(
                  color: dark
                      ? Colors.white
                      : TColor.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark
                      ? Colors.white
                      : TColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}