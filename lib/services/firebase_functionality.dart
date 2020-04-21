import 'package:firebase_auth/firebase_auth.dart';


class FirebaseFunctionality {
  final _auth = FirebaseAuth.instance;
  String errorMessage, errorLoginMessage;
  var user, existingUser;

  Future registration({String email, String password}) async {
    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          errorMessage = "Account Exist";
          break;
      }
    }
    return user;
  }

  String existAccount() {
    return errorMessage;
  }

  Future login({String email, String password}) async {
    try {
      existingUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      switch (error.code) {
        case "ERROR_USER_NOT_FOUND":
          errorLoginMessage = "User not found";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorLoginMessage = "Wrong password";
          break;
      }
    }
    if (errorLoginMessage != null) {
      return errorLoginMessage;
    }
    return existingUser;
  }

  String loginUnSuccess() {
    return errorLoginMessage;
  }
}
