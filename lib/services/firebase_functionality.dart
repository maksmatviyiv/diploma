import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/indicators_screen.dart';

class FirebaseFunctionality {
  final _auth = FirebaseAuth.instance;

  Future registration({String email, String password}) async {
    var newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser != null) {

      return newUser;
    }
  }

  Future login({String email, String password}) async {
    var existingUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
    if (existingUser != null) {
      return existingUser;
    }
  }

}
