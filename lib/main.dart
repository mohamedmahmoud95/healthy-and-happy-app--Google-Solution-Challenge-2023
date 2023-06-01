import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'Constants/project_colors.dart';
import 'Screens/home_screen/home_screen.dart';
import 'Screens/menu_screen/menu_screen.dart';
import 'screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

