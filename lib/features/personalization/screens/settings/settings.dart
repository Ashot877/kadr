import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kadr/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kadr/utils/helpers/helpers.dart';
import '../../../../common/widgets/list_tiles/user_profile_dart.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Динамический username
  final String username = 'Name Surname';

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  AppBar(
                    title: Text('Account', style: Theme.of(context).textTheme.titleLarge),
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    // toolbarHeight: 0,
                  ),

                  /// User Profile card
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            /// logout button
            const SizedBox(height: TSizes.spaceBtwSections * 20),
            SizedBox(
              width: 200, // можно задать фиксированную ширину
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? TColor.darkGreyText
                        : TColor.lightGreyText, // белый в темной теме, черный в светлой
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // скругление углов
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? TColor.darkGreyText
                        : TColor.lightGreyText,
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2.5),
          ],
        ),
      ),
    );
  }
}