
import 'package:flutter/material.dart';

import '../Constants/project_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(


    style: ElevatedButton.styleFrom(
      foregroundColor: mainWhite,
     // backgroundColor: mainBlue,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),

    onPressed: onClicked,

    child: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
  );
}