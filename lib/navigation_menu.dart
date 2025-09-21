import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kadr/features/personalization/screens/settings/settings.dart';
import 'package:kadr/features/weekly_movie/screens/home/home.dart';
import 'package:kadr/utils/constants/colors.dart';

import 'features/weekly_movie/screens/challenges/challenges_screen.dart';
import 'features/weekly_movie/screens/kadr/kadr.dart';
import 'features/weekly_movie/screens/rewards/rewards.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            const NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            const NavigationDestination(icon: Icon(Iconsax.message), label: 'Critics'),
            const NavigationDestination(icon: Icon(Iconsax.flag), label: 'TryMe'),
            const NavigationDestination(icon: Icon(Iconsax.award), label: 'Rewards'),
            const NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const CriticsScreen(),
    const ChallengesScreen(),
    const RewardsScreen(),
    const SettingsScreen(),
  ];
}