import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: const Image(
                  image: AssetImage('assets/app_icon.png'),
                ),
              ),
              Text('Login'.toUpperCase()),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text('LogIn'.toUpperCase())),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text('Create Account'),
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
