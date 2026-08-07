import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/ui/customer/customer.dart';
import 'package:login/widget/bottom_navigation.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff003465),
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor:  Color(0xff003465),
    systemNavigationBarIconBrightness: Brightness.dark
  ));
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
            fontSize: 16,
          ),

          
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(secondaryColor),
            minimumSize: WidgetStateProperty.all(Size.fromHeight(56)),
          ),
        ),

        colorScheme: ColorScheme.light(
          primary: secondaryColor,
          secondary: primaryTextColor,
        ),
        //colorScheme: ColorScheme.light(surface: Color(0xff5882C1)),
      ),
      home: Stack(
        children: [
          Positioned.fill(child: CustomerScreen()),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigation()),
        ],
      ),
    );
  }
}
