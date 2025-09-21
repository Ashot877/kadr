import 'package:flutter/material.dart';
import 'package:kadr/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:kadr/utils/theme/custom_themes/chip_theme.dart';
import 'package:kadr/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:kadr/utils/theme/custom_themes/text_field_theme.dart';
import 'package:kadr/utils/theme/custom_themes/text_theme.dart';
import 'package:kadr/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:kadr/utils/theme/custom_themes/appbar_theme.dart';

import '../constants/colors.dart';
import 'custom_themes/check_box_theme.dart';
import 'custom_themes/navigation_bar_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Albert Sans',
    brightness: Brightness.light,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: TColor.lightBack,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBox.lightCheckBoxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.black26,        // фон выделения
      cursorColor: Colors.black,             // курсор
      selectionHandleColor: Colors.black,    // ручки выделения
    ),
    navigationBarTheme: TNavigationBarTheme.lightNavigationBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Albert Sans',
    brightness: Brightness.dark,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: TColor.darkBack,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBox.darkCheckBoxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.white24,
      cursorColor: Colors.white,
      selectionHandleColor: Colors.white,
    ),
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarTheme,
  );
}