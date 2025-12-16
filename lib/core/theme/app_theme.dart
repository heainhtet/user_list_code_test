import 'package:flutter/material.dart';
import '../app_size/dimens.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimary,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: TextStyle(
        fontSize: Dimens.f20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: Dimens.f14, color: AppColors.textPrimary),
      titleMedium: TextStyle(
        fontSize: Dimens.f16,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.primary,
      labelStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(Dimens.r80),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(Dimens.r80),
      ),
    ),

    dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.dark(
      primary: AppColors.secondary,
      secondary: AppColors.primary,
      surface: Colors.black,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: Dimens.f20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
