import 'package:flutter/material.dart';

import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/indicators_screen.dart';

void main() => runApp(SmartSocket());

class SmartSocket extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: RegistrationScreen.id,
      routes: {
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        IndicatorsScreen.id :(context) => IndicatorsScreen()
      },
    );
  }
}
