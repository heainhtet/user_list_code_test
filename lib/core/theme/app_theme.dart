import 'package:flutter/material.dart';
import '../app_size/dimens.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

     colorScheme: ColorScheme.light(
      primary: AppColors.primary,           // dark blue
      secondary: AppColors.secondary,       // lighter blue
      surface: Colors.white,                 // white background
      onPrimary: Colors.white,               // text/icons on primary (dark blue) -> white
      onSecondary: Colors.white,             // text/icons on secondary (blue) -> white
      onSurface: Colors.black,               // text/icons on white surface -> black
    ),

    
//    appBarTheme: AppBarTheme(
//   backgroundColor: Colors.white,
//   foregroundColor: AppColors.primary,
//   elevation: 0,
//   iconTheme: IconThemeData(color: AppColors.primary),
//   // titleTextStyle: TextStyle(
//   //   fontSize: Dimens.f20,
//   //   fontWeight: FontWeight.bold,
//   //   color: AppColors.primary,
//   // ),
//   toolbarTextStyle: TextStyle( // add this, usually same as titleTextStyle
//     fontSize: Dimens.f20,
//     fontWeight: FontWeight.bold,
//     color: AppColors.primary,
//   ),
// ),
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

//     appBarTheme: AppBarTheme(
//   backgroundColor: Colors.black,
//   iconTheme: IconThemeData(color: Colors.white),
//   // titleTextStyle: TextStyle(
//   //   fontSize: Dimens.f20,
//   //   fontWeight: FontWeight.bold,
//   //   color: Colors.white,
//   // ),
//   toolbarTextStyle: TextStyle(
//     fontSize: Dimens.f20,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//   ),
//   elevation: 0,
// ),

  );
}
