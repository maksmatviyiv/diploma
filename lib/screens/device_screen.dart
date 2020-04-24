import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_socket/constants.dart';

import '../components/device_display.dart';
import '../services/firebase_functionality.dart';

class DeviceScreen extends StatefulWidget {
  static String id = "device_screen";

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final FirebaseFunctionality _firebaseFunctionality = FirebaseFunctionality();
  final _firestore = Firestore.instance;
  String _ownerId;
  @override
  void initState() {
    _firebaseFunctionality.getUid().then((value) => setState(() {
          _ownerId = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('devices')
                  .where('owner', isEqualTo: _ownerId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final devices = snapshot.data.documents;
                  List<DeviceDisplay> deviceWidgets = [];
                  for (var device in devices) {
                    final deviceName = device.data['customName'];
                    final deviceTemperature = device.data['temperature'];
                    final status = device.data['status'];
                    final idDocument = device.documentID;
                    final deviceWidget = DeviceDisplay(
                      documentId: idDocument,
                      deviceName: deviceName,
                      temperature: deviceTemperature,
                      status: status,
                    );
                    deviceWidgets.add(deviceWidget);
                  }
                  return ListView(
                    children: deviceWidgets,
                  );
                } else {
                  return Center(
                    child: Text(Strings.deviceNotFound),
                  );
                }
              }),
        ),
      ),
    );
  }
}
