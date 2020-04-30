import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/indicators_screen.dart';
import 'screens/device_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(SmartSocket());
}

class SmartSocket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IndicatorsScreen.id,
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        IndicatorsScreen.id: (context) => IndicatorsScreen(),
        DeviceScreen.id: (context) => DeviceScreen()
      },
    );
  }
}
