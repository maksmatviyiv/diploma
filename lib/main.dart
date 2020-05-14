import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/device_screen.dart';
import 'screens/indicators_screen.dart';
import 'screens/registration_screen.dart';

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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return IndicatorsScreen();
          }
          return RegistrationScreen();
        },
      ),
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        IndicatorsScreen.id: (context) => IndicatorsScreen(),
        DeviceScreen.id: (context) => DeviceScreen()
      },
    );
  }
}
