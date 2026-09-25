import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login/core/authentication/hive_entity/save_info.dart';
import 'package:login/core/startup/app_bootstrap.dart';
import 'package:login/core/startup/injection.dart';
import 'package:login/core/theme/app_theme.dart';

const saveInfoBoxName = 'saveInfoBoxName';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SaveInfoAdapter());
   await Hive.openBox<SaveInfo>(saveInfoBoxName);

  setupDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xff003465),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xff003465),
      systemNavigationBarIconBrightness: Brightness.dark,
    
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
        //colorScheme: ColorScheme.light(surface: Color(0xff5882C1)),
      AppTheme.lightTheme,
      home: const AppBootStrap(),
    );
  }
}
