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
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  child: Column(
                    children: [
                      const EmailTextFormField(),
                      const SizedBox(
                        height: 12,
                      ),
                      const PasswordTextFormField(),
                      const SizedBox(
                        height: 28,
                      ),
                      RaisedButton(
                          onPressed: () {}, child: Text('LogIn'.toUpperCase())),
                      const SizedBox(
                        height: 12,
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        label: const Text('Create Account'),
                        icon: const Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
