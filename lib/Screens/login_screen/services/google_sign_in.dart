import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function(UserCredential)? onSignInSuccess;
  final Function(dynamic)? onSignInError;

  GoogleSignInButton({this.onSignInSuccess, this.onSignInError});

  Future<void> _signInWithGoogle() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignIn _googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      if (onSignInSuccess != null) {
        onSignInSuccess!(userCredential);
      }
    } catch (error) {
      if (onSignInError != null) {
        onSignInError!(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _signInWithGoogle,
      child: Text('Sign in with Google'),
    );
  }
}
