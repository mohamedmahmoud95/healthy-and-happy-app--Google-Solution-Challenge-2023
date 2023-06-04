import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 20),textAlign: TextAlign.center,),
      backgroundColor:lavender,
      dismissDirection: DismissDirection.down,
      elevation: 1,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),    ),
  );
}