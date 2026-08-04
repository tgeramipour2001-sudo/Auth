import 'package:flutter/material.dart';
import 'package:login/ui/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color primaryTextColor = Color(0xffFFFFFF);
    final Color secondaryColor = Color(0xff003465);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          titleSmall: TextStyle(
            fontSize: 14,
            color: primaryTextColor,
            fontWeight: FontWeight.normal,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          headlineLarge: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 44,
          ),
          titleMedium: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(secondaryColor),
            minimumSize: WidgetStateProperty.all(Size.fromHeight(56)),
          ),
        ),

        //colorScheme: ColorScheme.light(surface: Color(0xff5882C1)),
      ),
      home: const LoginScreen(),
    );
  }
}
