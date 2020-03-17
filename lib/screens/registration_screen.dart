import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smart_socket/components/registration.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  "Smart Socket",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                flex: 3,
                child: Registration(titleRegistration: "Sign up"),
              ),
              SizedBox(height: 60.0),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text('Already have an account?'),
                    FlatButton(
                      onPressed: () {
                        print('New screen');
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
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
