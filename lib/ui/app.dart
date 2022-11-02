import 'package:flutter/material.dart';
import 'package:untitled1/ui/login/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LHTDD',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
