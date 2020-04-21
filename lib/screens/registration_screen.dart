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
                  child: Text(
                    "Smart Socket",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Registration(titleRegistration: "Sign up", action: registration,),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text('Already have an account?'),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: Text(
                          'Sign in',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
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
