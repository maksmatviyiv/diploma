import 'package:flutter/cupertino.dart';
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
          style: Style.signUpStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: Strings.hintEmail),
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (emailValid == false) {
                      return Strings.emailValidation;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: Strings.hintPassword),
                  obscureText: true,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value.length < 8) {
                      return Strings.passwordValidation;
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
          minWidth: 200.0,
          child: RaisedButton(
            color: Color.fromRGBO(141, 157, 127, 1),
            child: Text(widget.titleRegistration, style: Style.buttonTextStyle),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                if (widget.action == Strings.registration) {
                  _firebase.registration(email: _email, password: _password);
                  if (_firebase.existAccount() != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color.fromRGBO(134, 162, 114, 1),
                        content: Text(
                          _firebase.existAccount(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, IndicatorsScreen.id);
                  }
                } else {
                  _firebase.login(email: _email, password: _password);
                  if (_firebase.loginUnSuccess() != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color.fromRGBO(134, 162, 114, 1),
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
          ),
        )
      ],
    );
  }
}
