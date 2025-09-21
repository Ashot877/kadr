import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kadr/features/authentification/controllers/login/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

// class TSocialButtons extends StatelessWidget {
//   const TSocialButtons({
//     super.key,
//     required this.dark,
//   });
//
//   final bool dark;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: dark ? TColor.darkGreyText : TColor.lightGreyText,),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: IconButton(
//             onPressed: () {},
//             icon: Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(
//                 TImages.google,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: TSizes.spaceBtwItems),
//       ],
//     );
//   }
// }

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SizedBox(
      width: double.infinity, // Row занимает всю ширину
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Центрируем кнопки
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: dark ? TColor.darkGreyText : TColor.lightGreyText,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: Image.asset(
                TImages.google,
                width: TSizes.iconMd,
                height: TSizes.iconMd,
              ),
            ),
          ),
          // SizedBox(width: TSizes.spaceBtwItems), // Только если будет еще кнопка
        ],
      ),
    );
  }
}
