import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenwidth;
  static double? screenheight;

// height and width initailaztion
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenheight = mediaQueryData!.size.height;
    screenwidth = mediaQueryData!.size.width;
  }

  static get widthSize {
    return screenwidth;
  }

  static get heightsize {
    return screenheight;
  }

  static const spaceSmall = SizedBox(
    height: 25,
  );
  static final spacemedium = SizedBox(
    height: screenheight! * 0.08,
  );
  static final spacebig = SizedBox(
    height: screenheight! * 0.05,
  );
  // textform field

  static const OutlinedBorder =
  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)));

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.greenAccent),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red),
  );

  static const primaryColor = Colors.blue;
  static const emamColour = Colors.red;
}