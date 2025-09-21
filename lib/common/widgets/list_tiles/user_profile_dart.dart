import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/image_strings.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../../../../../utils/helpers/helpers.dart';

class TUserProfileTile extends StatelessWidget {
  final VoidCallback onPressed;
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Username', style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text('username@gmail,com', style: Theme.of(context).textTheme.bodyMedium),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black)),
    );
  }
}