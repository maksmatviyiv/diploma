import 'package:flutter/material.dart';

import '../services/firebase_functionality.dart';
import '../screens/indicators_screen.dart';

class Registration extends StatelessWidget {
  FirebaseFunctionality firebase = FirebaseFunctionality();
  String email;
  String password;
  final String titleRegistration;

  Registration({this.titleRegistration});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          titleRegistration,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (val) {
                  email = val;
                  print(email);
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onChanged: (val) {
                  password = val;
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        ButtonTheme(
          minWidth: 250.0,
          child: RaisedButton(
            onPressed: () {
              firebase.registration(email: email, password: password);
            },
            color: Colors.green,
            child: Text(titleRegistration),
          ),
        )
      ],
    );
  }
}
