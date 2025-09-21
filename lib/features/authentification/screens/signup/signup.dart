import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kadr/common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'package:kadr/features/authentification/screens/signup/widgets/signup_form.dart';
import 'package:kadr/utils/constants/sizes.dart';
import 'package:kadr/utils/helpers/helpers.dart';

import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections / 2),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections / 2),

              /// Social Button
              TSocialButtons(dark: THelperFunctions.isDarkMode(context)),
            ],
          ),
        ),
      ),
    );
  }
}
