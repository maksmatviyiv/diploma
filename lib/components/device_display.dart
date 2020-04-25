import 'package:flutter/material.dart';

import '../services/firebase_functionality.dart';
import '../constants.dart';

class DeviceDisplay extends StatelessWidget {
  final String deviceName;
  final String documentId;
  final int temperature;
  final bool status;
  final newDeviceNameController = TextEditingController();
  final FirebaseFunctionality firebaseFunctionality = FirebaseFunctionality();
  DeviceDisplay(
      {this.documentId, this.deviceName, this.temperature, this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: GestureDetector(
              child: Icon(Icons.edit)),
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
                                decoration: InputDecoration(
                                    hintText: Strings.hintChangeName),
                                controller: newDeviceNameController,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(Icons.edit_attributes,
                                    size: 35.0, color: Colors.green),
                                onPressed: () {
                                  firebaseFunctionality.changeName(
                                      documentId, newDeviceNameController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            color: Colors.red,
                            onPressed: () {
                              firebaseFunctionality.deleteDevice(documentId);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },

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
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
