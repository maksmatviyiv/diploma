import 'package:flutter/material.dart';

import '../services/firebase_functionality.dart';
import '../constants.dart';

class DeviceDisplay extends StatelessWidget {
  final String deviceName;
  final String documentId;
  final int temperature;
  final bool status;
  String newDeviceName;
  final FirebaseFunctionality firebaseFunctionality = FirebaseFunctionality();
  DeviceDisplay(
      {this.documentId, this.deviceName, this.temperature, this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(Strings.manageDevice),
                        content: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: TextField(
                                decoration: InputDecoration(hintText: Strings.hintChangeName),
                                onChanged: (newName) {
                                  newDeviceName = newName;
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  firebaseFunctionality.changeName(
                                      documentId, newDeviceName);
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.edit_attributes,
                                  size: 35.0,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              firebaseFunctionality.deleteDevice(documentId);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 35.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Icon(Icons.edit)),
          title: Text(deviceName),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(temperature.toString()),
              Switch(
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.red,
                value: status,
                onChanged: (bool newValue) {
                  firebaseFunctionality.turnOnOffDevice(documentId, newValue);
                },
              )
            ],
          ),
          onTap: () {
            print(deviceName);
          },
        ),
        Divider(color: Colors.black,),
      ],
    );
  }
}
