import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
//
// class TLoginHeader extends StatelessWidget {
//   const TLoginHeader({
//     super.key,
//     required this.dark,
//   });
//
//   final bool dark;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image(
//           height: 75,
//           image: AssetImage(
//             dark ? TImages.darkAppLogo : TImages.lightAppLogo,
//           ),
//         ),
//         Text(
//           TTexts.loginTitle,
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         const SizedBox(height: TSizes.sm),
//         Text(
//           TTexts.loginSubTitle,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ],
//     );
//   }
// }

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Логотип можно чуть вправо для красоты, или выровнять по title
        Padding(
          padding: const EdgeInsets.only(left: TSizes.defaultSpace - 17),
          child: Image(
            height: 75,
            image: AssetImage(
              dark ? TImages.darkAppLogo : TImages.lightAppLogo,
            ),
          ),
        ),

        const SizedBox(height: TSizes.lg),

        // Title ровно с отступом defaultSpace
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace - 17),
            child: Text(
              TTexts.loginTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),

        const SizedBox(height: TSizes.xs),

        // Subtitle ровно с тем же отступом
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace - 15),
            child: Text(
              TTexts.loginSubTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
