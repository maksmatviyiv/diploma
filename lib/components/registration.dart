import 'package:flutter/material.dart';

class Registration extends StatelessWidget {

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
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
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
            onPressed: () {},
            color: Colors.green,
            child: Text(titleRegistration),
          ),
        )
      ],
    );
  }
}
