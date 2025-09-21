import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:iconsax/iconsax.dart';
import 'package:kadr/utils/helpers/helpers.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Image
            Image(
              image: AssetImage(dark ? TImages.resetPasswordDark: TImages.resetPasswordLight),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Title & subTitle
            Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.done))),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  TTexts.resendEmail,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}