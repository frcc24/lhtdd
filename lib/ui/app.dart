import 'package:flutter/material.dart';
import 'package:untitled1/ui/login/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(208, 41, 49, 1.0);
    final primaryColorDark = Color.fromRGBO(138, 28, 33, 1.0);
    final primaryColorLight = Color.fromRGBO(217, 79, 84, 1.0);
    final secondaryColor = Color.fromRGBO(211, 47, 47, 1.0);

    return MaterialApp(
      title: 'LHTDD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: secondaryColor,
        primaryColorDark: primaryColorDark,
        primaryColorLight: primaryColorLight,
        backgroundColor: Colors.white,
        accentColor: secondaryColor,
        // colorScheme:
        //     ColorScheme.fromSwatch().copyWith(secondary: secondaryColor)
      ),
      home: const LoginPage(),
    );
  }
}
