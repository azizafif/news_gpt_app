import 'package:firebase_auth/firebase_auth.dart';

import '../../../../api/exports.dart';

class AuthService extends RequestPerformer {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Successful signup
    } catch (e) {
      return e.toString(); // Error message
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Successful signin
    } catch (e) {
      return e.toString(); // Error message
    }
  }

  // Sign out
  Future signOut() async {
    await _auth.signOut();
  }

  // Check if the user is signed in
  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }
}
