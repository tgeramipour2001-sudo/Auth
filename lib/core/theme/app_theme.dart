import 'package:flutter/material.dart';
import 'package:login/core/theme/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xffFFFFFF),
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xffFFFFFF),
      ),
      headlineLarge: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: Color(0xffFFFFFF),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xffFFFFFF),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(secondaryColor),
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(56)),
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: secondaryColor,
      secondary: primaryTextColor,
    ),
  );
}
