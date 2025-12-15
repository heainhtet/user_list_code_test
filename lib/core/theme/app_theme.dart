import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400,
      tertiary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade600,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey[800],
      displayColor: Colors.black,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: Colors.grey[300],
      displayColor: Colors.white,
    ),
    useMaterial3: true,
  );
}
