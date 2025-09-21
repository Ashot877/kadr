import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/features/authentification/controllers/signup/signup_controller.dart';
import 'package:kadr/features/authentification/screens/signup/verify_email.dart';
import 'package:kadr/features/authentification/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:kadr/utils/validators/validation.dart';

import '../../../../../common/widgets/login_signup/form_divider.dart';

///import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helpers.dart';

///import '../../../../../utils/helpers/helpers.dart';

// class TSignupForm extends StatelessWidget {
//   const TSignupForm({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   expands: false,
//                   decoration: const InputDecoration(
//                     labelText: TTexts.firstName,
//                     prefixIcon: Icon(Iconsax.user),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: TSizes.spaceBtwInputFields),
//               Expanded(
//                 child: TextFormField(
//                   expands: false,
//                   decoration: const InputDecoration(
//                     labelText: TTexts.lastName,
//                     prefixIcon: Icon(Iconsax.user),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Username
//           TextFormField(
//             expands: false,
//             decoration: const InputDecoration(
//               labelText: TTexts.username,
//               prefixIcon: Icon(Iconsax.user_edit),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Email
//           TextFormField(
//             expands: false,
//             decoration: const InputDecoration(
//               labelText: TTexts.email,
//               prefixIcon: Icon(Iconsax.direct),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Phone Number
//           TextFormField(
//             expands: false,
//             decoration: const InputDecoration(
//               labelText: TTexts.phoneNo,
//               prefixIcon: Icon(Iconsax.call),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Password
//           TextFormField(
//             obscureText: true,
//             decoration: const InputDecoration(
//               labelText: TTexts.password,
//               prefixIcon: Icon(Iconsax.password_check),
//               suffixIcon: Icon(Iconsax.eye_slash),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwSections),
//
//           /// Terms & condition checkbox
//           const TTermsAndConditionCheckbox(),
//           const SizedBox(height: TSizes.spaceBtwSections),
//
//           ///Sign Up Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: const Text(TTexts.createAccount),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  InputDecoration fieldDecoration({required String label, IconData? suffix}) {
    return InputDecoration(
      labelText: label,
      suffixIcon: suffix != null ? Icon(suffix) : null,
      // prefixIcon берется автоматически из темы через labelText или можно добавить отдельно
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    // Общий стиль текста для всех полей
    final fieldTextStyle = TextStyle(
      fontSize: 16,
      color: dark ? Colors.white : Colors.black,
    );

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First name', value),
                  style: fieldTextStyle,
                  cursorColor: dark ? Colors.white : Colors.black,
                  decoration: fieldDecoration(label: TTexts.firstName),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last name', value),
                  style: fieldTextStyle,
                  cursorColor: dark ? Colors.white : Colors.black,
                  decoration: fieldDecoration(label: TTexts.lastName),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),

          TFormDivider(dividerText: TTexts.or.capitalize!),

          const SizedBox(height: TSizes.spaceBtwSections / 2),

          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText('Username', value),
            style: fieldTextStyle,
            cursorColor: dark ? Colors.white : Colors.black,
            decoration: fieldDecoration(label: TTexts.username),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            style: fieldTextStyle,
            cursorColor: dark ? Colors.white : Colors.black,
            decoration: fieldDecoration(label: TTexts.email),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            style: fieldTextStyle,
            cursorColor: dark ? Colors.white : Colors.black,
            decoration: fieldDecoration(label: TTexts.phoneNo),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value, // скрытие/показ пароля
              style: fieldTextStyle,
              cursorColor: dark ? Colors.white : Colors.black,
              decoration: InputDecoration(
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: () {
                    controller.hidePassword.value = !controller.hidePassword.value; // переключение
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections / 2),

          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections / 2),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

