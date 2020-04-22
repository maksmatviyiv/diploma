import 'package:flutter/material.dart';
import '../services/firebase_functionality.dart';

class DeviceDisplay extends StatelessWidget {
  final String deviceName;
  final String documentId;
  final int temperature;
  final bool status;
  final FirebaseFunctionality firebaseFunctionality = FirebaseFunctionality();
  DeviceDisplay({this.documentId, this.deviceName, this.temperature, this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
