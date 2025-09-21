import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/features/authentification/screens/password_configuration/reset_password.dart';
import 'package:kadr/utils/helpers/helpers.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Heading
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Text fields
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
              style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontSize: 16,
              ),
              cursorColor: dark ? Colors.white : Colors.black,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}