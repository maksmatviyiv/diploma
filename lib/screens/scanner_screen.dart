import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

import '../services/firebase_functionality.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  FirebaseFunctionality _firebaseFunctionality = FirebaseFunctionality();
  String _idDevice;
  String errorMessage;
  Widget startWidget() {
    if (errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(errorMessage),
              RaisedButton(
                child: Text("Try again"),
                onPressed: () {
                  scan();
                },
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold();
    }
  }

  @override
  void initState() {
    scan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: startWidget());
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      this._idDevice = barcode;
      _firebaseFunctionality.addDevice(this._idDevice);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.errorMessage = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.errorMessage = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.errorMessage =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.errorMessage = 'Unknown error: $e');
    }
  }
}
