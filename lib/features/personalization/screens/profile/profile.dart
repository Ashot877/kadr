import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:kadr/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80, padding: 0,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Profile Info
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              
              TProfileMenu(title: 'Name', value: 'Bruno Mars', onPressed: (){}),
              TProfileMenu(title: 'Username', value: 'Bmars2000', onPressed: (){}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User Id', value: '7777777', icon: Iconsax.copy, onPressed: (){}),
              TProfileMenu(title: 'E-Mail', value: 'Bruno_Mars@gmail.com', onPressed: (){}),
              TProfileMenu(title: 'Phone', value: '+374-77-777777', onPressed: (){}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
