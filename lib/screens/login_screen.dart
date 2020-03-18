import 'package:flutter/material.dart';

import 'package:smart_socket/components/registration.dart';

class LoginScreen extends StatelessWidget {
  static String id = "login_screen";
  @override
  Widget build(BuildContext context) {
    return Registration(titleRegistration: "Login");
  }
}
