import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/ui/ui.dart';

import 'local_widgets/local_wodgets.dart';
import 'login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  static const ROUTE = '/login_page';

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
                          onPressed: () {
                            Get.toNamed(DashboardPage.ROUTE);
                          },
                          child: Text('Sing In')),
                      const SizedBox(
                        height: 12,
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        label: const Text('Forgot password'),
                        icon: const Icon(Icons.lock_reset),
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
