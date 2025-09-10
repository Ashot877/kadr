import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
      headlineMedium: TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black),
      bodyLarge: TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w400, color: Color(0xFF757575)),
      bodyMedium: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
      bodySmall: TextStyle().copyWith(fontSize: 8.0, fontWeight: FontWeight.w400, color: Colors.black),
      titleLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.black),
      titleMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFF202020)),
      labelLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.white),
  );
  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
      headlineMedium: TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
      bodyLarge: TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w400, color: Color(0xFFC4C4C4)),
      bodyMedium: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white),
      bodySmall: TextStyle().copyWith(fontSize: 8.0, fontWeight: FontWeight.w400, color: Colors.white),
      titleLarge: TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
      titleMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFE2E2E2)),
      labelLarge: TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black),
  );
}