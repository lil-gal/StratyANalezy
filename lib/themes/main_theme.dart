import 'package:flutter/material.dart';


class AppTheme {
  static const Color normal = Color.fromARGB(255, 255, 164, 59);
  static const Color hover = Color.fromARGB(255, 255, 183, 102);
  static const Color hoverAlt = Color.fromARGB(255, 255, 237, 137);
  static const Color hover2 = Color.fromARGB(255, 255, 238, 216);
  static const Color active = Color.fromARGB(255, 253, 101, 36);
  static const Color disabled = Color.fromARGB(255, 228, 183, 102);

  static const Color background = Color.fromARGB(255, 255, 255, 255);

  static const Color error = Color.fromRGBO(183, 28, 28, 1);
  
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
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,

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

    inputDecorationTheme: InputDecorationTheme(
      hoverColor: AppTheme.hover,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppTheme.normal, width: 1.5),
      ),
      focusColor: AppTheme.active,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppTheme.active, width: 2.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppTheme.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppTheme.error, width: 2.5),
      ),
    )

    );
  }
}