import 'package:flutter/material.dart';

import 'Constants/project_colors.dart';
import 'View/Screens/login_screen/login_screen.dart';

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
