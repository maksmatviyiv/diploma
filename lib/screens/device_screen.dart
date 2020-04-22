import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceScreen extends StatelessWidget {

  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('devices').where('owner', isEqualTo: 'maksym.matviyiv1998@gmail.com').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final devices = snapshot.data.documents;
                List<Text> deviceWidgets = [];
                for (var device in devices) {
                  final deviceName = device.data['customName'];
                  final deviceTemperature = device.data['temperature'].toString();

                  final deviceWidget = Text('$deviceName, $deviceTemperature');
                  deviceWidgets.add(deviceWidget);
                }
                return Column(
                  children: deviceWidgets,
                );
              }
              return Center(
                child:  Text("No devices"),
              );

            }
          ),
        ),
        ),
      );
  }
}
