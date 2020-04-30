import 'package:flutter/material.dart';

import '../components/adaptive_bottom_navigation_bar.dart';
import 'device_screen.dart';
import 'scanner_screen.dart';

class IndicatorsScreen extends StatefulWidget {
  static String id = "indicators_screen";

  @override
  _IndicatorsScreenState createState() => _IndicatorsScreenState();
}

class _IndicatorsScreenState extends State<IndicatorsScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [DeviceScreen(), ScannerScreen()];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: AdaptiveBottomNavigationBar(
        index: _currentIndex,
        onTap: onTapped,
      ),
    );
  }
}
