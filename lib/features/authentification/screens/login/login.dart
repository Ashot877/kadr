import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/common/styles/spacing_styles.dart';
import 'package:kadr/features/authentification/screens/login/widgets/login_form.dart';
import 'package:kadr/features/authentification/screens/login/widgets/login_header.dart';
import 'package:kadr/utils/constants/colors.dart';
import 'package:kadr/utils/constants/image_strings.dart';
import 'package:kadr/utils/constants/text_strings.dart';
import 'package:kadr/utils/helpers/helpers.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title & sub-title
              TLoginHeader(dark: dark),

              /// form
              TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              TSocialButtons(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}
