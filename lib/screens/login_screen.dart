import 'package:flutter/material.dart';

import 'package:smart_socket/components/registration.dart';
import 'package:smart_socket/constants.dart';

class LoginScreen extends StatelessWidget {
  static String id = "login_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Registration(titleRegistration: "Login", action: login),
      );

  }
}
