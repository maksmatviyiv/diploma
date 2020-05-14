import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
//    _firebaseFunctionality.getUid().then((value) => setState(() {
//          _ownerId = value;
//        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: FirebaseAuth.instance.currentUser(),
            builder: (context, futureShapshot) {
              if (futureShapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return StreamBuilder(
                stream: _firestore
                    .collection('devices')
                    .where('owner',
                        isEqualTo: futureShapshot.data.uid.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  final devicesDocuments =
                      snapshot.data == null ? null : snapshot.data.documents;
                  return ListView.builder(
                    itemCount:
                        devicesDocuments == null ? 0 : devicesDocuments.length,
                    itemBuilder: (ctx, index) => DeviceDisplay(
                      documentId: devicesDocuments[index].documentID,
                      deviceName: devicesDocuments[index]['customName'],
                      temperature: devicesDocuments[index]['temperature'],
                      status: devicesDocuments[index]['status'],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
