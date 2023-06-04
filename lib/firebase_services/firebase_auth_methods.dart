import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mental_health_app/Models/appUser.dart';

class FirebaseAuthMethods {
  AppUser? _userFromFirebase(User? user) {
    return user != null ? AppUser(id: user.uid) : null;
  }

  Future<AppUser?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<AppUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {

        debugPrint(e.toString());

      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
