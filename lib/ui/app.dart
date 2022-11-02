import 'package:flutter/material.dart';
import 'package:untitled1/ui/login/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(208, 41, 49, 1.0);
    final primaryColorDark = Color.fromRGBO(103, 9, 14, 1.0);
    final primaryColorLight = Color.fromRGBO(185, 72, 76, 1.0);
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
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: primaryColorDark),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: primaryColor,
          alignLabelWithHint: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColorLight),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          textTheme: ButtonTextTheme.primary,
          buttonColor: primaryColor,
          splashColor: primaryColorLight,
          colorScheme: ColorScheme.light(
            primary: primaryColor,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
