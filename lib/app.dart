import 'package:flutter/material.dart';
import 'package:kadr/bindings/general_bindings.dart';
import 'package:kadr/features/authentification/screens/onboarding/onboarding.dart';
import 'package:kadr/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: OnBoardingScreen(),
    );
  }
}

