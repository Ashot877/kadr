import 'package:flutter/material.dart';
import 'package:kadr/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:kadr/utils/theme/custom_themes/chip_theme.dart';
import 'package:kadr/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:kadr/utils/theme/custom_themes/text_field_theme.dart';
import 'package:kadr/utils/theme/custom_themes/text_theme.dart';
import 'package:kadr/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:kadr/utils/theme/custom_themes/appbar_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Albert Sans',
    brightness: Brightness.light,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Albert Sans',
    brightness: Brightness.dark,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkINputDecorationTheme,
  );
}