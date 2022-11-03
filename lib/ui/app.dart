import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled1/ui/login/login_page.dart';

import '../routes/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(86, 66, 103, 1.0);
    final primaryColorDark = Color.fromRGBO(57, 43, 68, 1.0);
    final primaryColorLight = Color.fromRGBO(87, 75, 101, 1.0);

    return GetMaterialApp(
      title: 'LHTDD',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(primaryColor, primaryColorDark, primaryColorLight),
      initialRoute: LoginPage.ROUTE,
      //initialBinding: widget.globalBindings ?? GlobalBindings(),
      getPages: getAppPages(),
      home: const LoginPage(),
    );
  }

  ThemeData buildThemeData(
      Color primaryColor, Color primaryColorDark, Color primaryColorLight) {
    return ThemeData(
      colorSchemeSeed: primaryColorDark,
      //primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      backgroundColor: Colors.white,
      accentColor: primaryColor,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w500, color: primaryColorDark),
        headline6: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70),
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        textTheme: ButtonTextTheme.primary,
        buttonColor: primaryColor,
        splashColor: primaryColorLight,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
      ),
    );
  }
}
