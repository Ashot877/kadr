import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(

      ///text for app
      displayLarge: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
      displayMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
      displaySmall: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),

      headlineLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
      headlineMedium: TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black),
      headlineSmall: TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),

      bodyLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color(0xFF757575)),
      bodyMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
      bodySmall: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColor.lightGreyText),

      /// title - subTitle
      titleLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
      titleMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: TColor.lightGreyText),
      titleSmall: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),

      labelLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
      /// Divider
      labelSmall: TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w400, color: TColor.lightGreyText),
  );
  static TextTheme darkTextTheme = TextTheme(
      displayLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
      displayMedium: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
      displaySmall: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),

      headlineLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
      headlineMedium: TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
      headlineSmall: TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),

      bodyLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color(0xFFC4C4C4)),
      bodyMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
      bodySmall: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: TColor.darkGreyText),

      /// title - subTitle
      titleLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
      titleMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: TColor.darkGreyText),
      titleSmall: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),

      labelLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
      /// Divider
      labelSmall: TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w400, color: TColor.darkGreyText),
  );
}