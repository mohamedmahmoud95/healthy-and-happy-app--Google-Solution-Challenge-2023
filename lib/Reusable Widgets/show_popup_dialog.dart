import 'package:flutter/material.dart';
import 'package:mental_health_app/Reusable%20Widgets/show_snackbar_widget.dart';
import 'package:mental_health_app/firebase_services/firebase_auth_methods.dart';

import '../Constants/project_colors.dart';

void showPopUpDialog({
  required String title,
  required String actionText,
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: codeController,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: Text(actionText),
        )
      ],
    ),
  );
}




TextEditingController emailToSendResetPasswordEmailToController = TextEditingController();

void resetPasswordPopUpDialog({
  required BuildContext context,
}) {
  showDialog(

    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(

      title: const Text("Reset password", style: TextStyle(color: mainPurple, fontSize: 20),),
      backgroundColor: mainWhite,
      elevation: 2,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: emailToSendResetPasswordEmailToController,
            style:  const TextStyle(color: Colors.black),

            decoration: InputDecoration(
              hintText: "Enter your email and we will send you a reset-password email..",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: lavender),
              ),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: <Widget>[

        TextButton(
          onPressed: (){
            FirebaseAuthMethods().resetPassword(emailToSendResetPasswordEmailToController.text);
            Navigator.of(context).pop();
            showSnackBar(context, "Password reset email was sent to ${emailToSendResetPasswordEmailToController.text}");
          },
          child: const Text("Send", style: TextStyle(color: mainBlue, )),
        ),

        TextButton(
          onPressed: (){ Navigator.of(context).pop(); },
          child: const Text("Cancel", style: TextStyle(color: Colors.red, )),
        )
      ],
    ),
  );



}
