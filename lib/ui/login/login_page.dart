import 'package:flutter/material.dart';

import 'local_widgets/local_wodgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginHeader(),
              Text(
                'Login'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text('LogIn'.toUpperCase())),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Text('Create Account'),
                      icon: const Icon(Icons.person),
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
