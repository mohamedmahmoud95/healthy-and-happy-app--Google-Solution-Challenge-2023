import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mental_health_app/Models/appUser.dart';

class FirebaseAuthMethods {
  AppUser? _userFromFirebase(User? user) {
    return user != null
        ? AppUser(
            id: user.uid,
            email: 'example@gmail.com',
            password: '12345678',
            firstName: 'first name',
            lastName: 'last name',
            phoneNumber: '01234567890',
            profilePicUrl: 'assets/images/profile_pic.png',
            about: 'About',
            bookedAppointmentsIDs: [])
        : null;
  }

  Future<AppUser?> registerWithEmailAndPassword(
      String email,
      String password,
      VoidCallback onLoginSuccess,
      VoidCallback onLoginFailed,

      ) async {

    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _userFromFirebase(authResult.user) == null? currentAppUser = sampleAppUser1:
      currentAppUser = _userFromFirebase(authResult.user)!;
      onLoginSuccess;
      return _userFromFirebase(authResult.user);
    } catch (e) {
      debugPrint(e.toString());
      onLoginFailed;
      return null;
    }
  }

  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
    VoidCallback onLoginSuccess,
    VoidCallback onLoginFailed,
  ) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Call the onLoginSuccess callback
      onLoginSuccess();

      // Update the current user

      _userFromFirebase(authResult.user) == null? currentAppUser = sampleAppUser1:
      currentAppUser = _userFromFirebase(authResult.user)!;
      return _userFromFirebase(authResult.user);
    } catch (e) {
      debugPrint(e.toString());

      // Call the onLoginFailed callback
      onLoginFailed();

      // Return null to indicate login failure
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> deleteAccount(String email, String password) async {
    try {
      // Re-authenticate the user with their email and password
      AuthCredential credential = EmailAuthProvider.credential(
          email: '${FirebaseAuth.instance.currentUser?.email}',
          password: password);
      await FirebaseAuth.instance.currentUser
          ?.reauthenticateWithCredential(credential);

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
