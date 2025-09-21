import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class MyItemsTab extends StatelessWidget {
  const MyItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You havent items yet',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 18
        ),
      ),
    );
  }
}