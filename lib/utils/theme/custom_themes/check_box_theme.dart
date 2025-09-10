import 'package:flutter/material.dart';

class TCheckBox {
  TCheckBox._();

  static final lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.yellow;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.yellow;
        }
        return Colors.grey;
      },
    ),
  );

  static final darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.yellow;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.yellow;
        }
        return Colors.grey;
      },
    ),
  );
}
