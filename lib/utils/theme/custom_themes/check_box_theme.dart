import 'package:flutter/material.dart';
import 'package:kadr/utils/constants/colors.dart'; // TColor

class TCheckBox {
  TCheckBox._();

  static final lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.transparent;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return TColor.lightGreyText;
        }
        return Colors.transparent;
      },
    ),
    side: BorderSide(color: TColor.lightGreyText), // просто фиксированная рамка
  );

  static final darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.transparent;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return TColor.darkGreyText;
        }
        return Colors.transparent;
      },
    ),
    side: BorderSide(color: TColor.darkGreyText), // фиксированная рамка
  );
}
