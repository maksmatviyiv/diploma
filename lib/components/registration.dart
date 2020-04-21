import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/firebase_functionality.dart';
import '../screens/indicators_screen.dart';
import '..//../constants.dart';

class Registration extends StatefulWidget {
  final String titleRegistration;
  final String action;
  Registration({this.titleRegistration, this.action});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  FirebaseFunctionality _firebase = FirebaseFunctionality();
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.titleRegistration,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (emailValid == false) {
                      return "Please input correct email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value.length < 8) {
                      return "Password must contains more than 8 char";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        ButtonTheme(
          minWidth: 250.0,
          child: RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                if (widget.action == registration) {
                  _firebase.registration(email: _email, password: _password);
                  if (_firebase.existAccount() != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _firebase.existAccount(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    print(_firebase.existAccount());
                    Navigator.pushNamed(context, IndicatorsScreen.id);
                  }
                } else {
                  _firebase.login(email: _email, password: _password);
                  if (_firebase.loginUnSuccess() != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _firebase.loginUnSuccess(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, IndicatorsScreen.id);
                  }
                }
              }
            },
            color: Colors.green,
            child: Text(widget.titleRegistration),
          ),
        )
      ],
    );
  }
}
