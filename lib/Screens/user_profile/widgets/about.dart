
import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_therapists/page/widget/BookingPage.dart';

import '../../../Reusable Widgets/button_widget.dart';
import '../utils/constants.dart';

Widget buildContent(BuildContext context, String doctorName, String about,bool isPatient) {
  return Column(
    children: [
      SizedBox(height: 8),
      Text(
        doctorName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: titleFontSize,
        ),
      ),
      SizedBox(height: 8),
      if(isPatient)
        Text(
          'Doctor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: subTextColor,
            fontSize: subtitleFontSize,
          ),
        )
      else
        Text(
          'Patient',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: subTextColor,
            fontSize: subtitleFontSize,
          ),
        ),
      SizedBox(height: 16),
      buildAbout(about),
      SizedBox(height: 32),
      if(isPatient)
        Center(
          child: ButtonWidget(
            text: 'Book a session',
            onClicked: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingPage(
                    isPatient: true,
                  ),
                ),
              );
            },
          ),
        ),

      SizedBox(height: 16),
    ],
  );
}


Widget buildAbout(String about) {
  return Container(
    margin: EdgeInsets.only(left: padding, right: padding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        SizedBox(height: 8),
        Text('About',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: titleFontSize)),
        SizedBox(height: 8),
        Text(
            about,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: subTextColor,
                fontSize: subtitleFontSize)),
      ],
    ),
  );
}