import 'package:flutter/material.dart';
import 'package:login/core/theme/colors.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,

    textTheme: const TextTheme(
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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
