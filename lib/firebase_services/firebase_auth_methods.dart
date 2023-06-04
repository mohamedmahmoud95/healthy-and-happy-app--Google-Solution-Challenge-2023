import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mental_health_app/Models/appUser.dart';

class FirebaseAuthMethods {
  AppUser? _userFromFirebase(User? user) {
    return user != null ? AppUser(id: user.uid) : null;
  }

  Future<AppUser?> registerWithEmailAndPassword(String email,
      String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      thisAppUser = _userFromFirebase(authResult.user)!;
      return _userFromFirebase(authResult.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<AppUser?> loginWithEmailAndPassword(String email, String password,
      VoidCallback onLoginSuccess, VoidCallback onLoginFailed) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      onLoginSuccess();
      thisAppUser = _userFromFirebase(authResult.user)!;
      return _userFromFirebase(authResult.user);
    } catch (e) {
      debugPrint(e.toString());
      onLoginFailed();
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  //
  // Future<void> deleteAccount(String email) async {
  //   try {
  //     await FirebaseAuth.instance.currentUser?.delete();
  //   }
  //   catch (e) {
  //     debugPrint(e.toString());
  //     FirebaseAuth.instance.currentUser?.delete();
  //     return;
  //   }
  // }


  Future<void> deleteAccount(String email, String password) async {
    try {
      // Re-authenticate the user with their email and password
      AuthCredential credential = EmailAuthProvider.credential(
          email: '${FirebaseAuth.instance.currentUser?.email}',
          password: password);
      await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(
          credential);

      // Delete the account
      await FirebaseAuth.instance.currentUser?.delete();

      // Account deletion successful
      debugPrint('Account deleted successfully');
      logout();
    } catch (e) {
      // Handle any errors that occur during re-authentication or account deletion
      debugPrint('Error deleting account: $e');
    }
  }
}
