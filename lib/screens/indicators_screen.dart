import 'package:flutter/material.dart';
import 'package:smart_socket/constants.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        onTap: onTapped,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(Strings.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(Strings.addDevice)
          ),
        ],
      ),
    );
  }
}
