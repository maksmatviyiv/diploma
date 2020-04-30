import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdaptiveButton extends StatelessWidget {
  final Function onPress;
  final Widget child;

  AdaptiveButton({@required this.child, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Color.fromRGBO(141, 157, 127, 1),
            child: child,
            onPressed: onPress)
        : RaisedButton(
            color: Color.fromRGBO(141, 157, 127, 1),
            child: child,
            onPressed: onPress);
  }
}
