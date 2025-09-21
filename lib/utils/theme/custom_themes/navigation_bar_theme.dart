import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: Colors.white,
    indicatorColor: Colors.black.withAlpha((0.2 * 255).round()),
    labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400, color: Colors.black);
        }
        return const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400, color: TColor.lightGreyText);
      },
    ),

    iconTheme: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.black);
        }
        return const IconThemeData(color: TColor.lightGreyText);
      },
    ),
  );

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: Colors.black,
    indicatorColor: Colors.white.withAlpha((0.2 * 255).round()),
    labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold, color: Colors.white);
        }
        return const TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold, color: TColor.darkGreyText);
      },
    ),

    iconTheme: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.white);
        }
        return const IconThemeData(color: TColor.darkGreyText);
      },
    ),
  );
}