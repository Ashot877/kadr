import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/features/authentification/controllers/login/login_controller.dart';
import 'package:kadr/features/authentification/screens/password_configuration/forget_password.dart';
import 'package:kadr/navigation_menu.dart';
import 'package:kadr/utils/helpers/helpers.dart';
import 'package:kadr/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);
    final fieldTextStyle = TextStyle(
      fontSize: 16,
      color: dark ? Colors.white : Colors.black,
    );

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
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

            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                // скрытие/показ пароля
                style: fieldTextStyle,
                cursorColor: dark ? Colors.white : Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value; // переключение
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember me & Forget me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value = ! controller.rememberMe.value,
                      ),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  style: TextButton.styleFrom(
                    foregroundColor: dark
                        ? TColor.darkGreyText
                        : TColor.lightGreyText,
                  ),
                  child: const Text(TTexts.forgetPasswordTitle),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TTexts.signIn),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  foregroundColor: dark ? Colors.white : Colors.black,
                  side: BorderSide(
                    color: dark ? Colors.white70 : Colors.black54,
                  ),
                ),
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
