import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smart_socket/components/registration.dart';
import 'package:smart_socket/constants.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = "registration_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(Strings.applicationName,
                      style: Style.applicationName),
                ),
                Expanded(
                  flex: 6,
                  child: Registration(
                      titleRegistration: Strings.signUp,
                      action: Strings.registration),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text(
                        Strings.questionAboutAccount,
                        style: Style.questionAboutAccountStyle,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: Text(
                          'Sign in',
                          style: Style.signInStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
