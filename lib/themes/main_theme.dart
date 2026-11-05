import 'package:flutter/material.dart';


class AppTheme {
  static const Color normal = Color.fromARGB(255, 255, 164, 59);
  static const Color hover = Color.fromARGB(255, 255, 183, 102);
  static const Color hoverAlt = Color.fromARGB(255, 255, 237, 137);
  static const Color active = Color.fromARGB(255, 253, 101, 36);
  static const Color disabled = Color.fromARGB(255, 228, 183, 102);

  static const Color background = Color.fromARGB(255, 255, 238, 216);

  static const Color error = Color.fromARGB(255, 238, 55, 49);
  
  static const Color slightlyGray = Color.fromARGB(255,225,225,225);
  static const Color gray = Colors.grey;

  static const Color inputFieldBg = Colors.white;

  static const Color iconColorDefault = Colors.white;
  static const Color iconColorSecondary = Colors.black;

  static const Color textDefault = Colors.white;
  static const Color textDisabled = Colors.black;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: normal),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) return disabled;
            if (states.contains(WidgetState.pressed)) return active;
            if (states.contains(WidgetState.hovered)) return hover;
            return normal;
          }),

          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) return textDisabled;
            return textDefault;
          }),
        ),
      ),
    );
  }
}