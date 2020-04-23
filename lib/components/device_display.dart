import 'package:flutter/material.dart';
import '../services/firebase_functionality.dart';

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
    return ListTile(
      leading: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Input new name for device"),
                    content: TextField(
                      onChanged: (newName) {
                        newDeviceName = newName;
                      },
                    ),
                    actions: [
                      RaisedButton(
                          child: Text("Change name"),
                          onPressed: () {
                            firebaseFunctionality.changeName(
                                documentId, newDeviceName);
                            Navigator.of(context).pop();
                          }),
                      RaisedButton(
                          child: Text("Delete device"),
                          onPressed: () {
                            firebaseFunctionality.deleteDevice(documentId);
                            Navigator.of(context).pop();
                          })
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
    );
  }
}
