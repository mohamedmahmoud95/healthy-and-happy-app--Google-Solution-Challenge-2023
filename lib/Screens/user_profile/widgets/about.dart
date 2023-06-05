
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_therapists/page/widget/BookingPage.dart';

import '../../../Reusable Widgets/button_widget.dart';
import '../utils/constants.dart';

Widget buildContent(BuildContext context, String doctorName, String about,bool isPatient) {
  return Column(
    children: [


      const SizedBox(height: 16),
      buildAbout(about),
      const SizedBox(height: 32),
      if(isPatient)
        Center(
          child: ButtonWidget(
            text: 'Book a session',
            onClicked: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookingPage(
                    isPatient: true,
                  ),
                ),
              );
            },
          ),
        ),

      const SizedBox(height: 16),
    ],
  );
}


Widget buildAbout(String about) {
  return Container(
    margin: const EdgeInsets.only(left: padding, right: padding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const SizedBox(height: 8),
        const Text('About',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: mainPurple,
                fontSize: titleFontSize)),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                about,
                style: const TextStyle(


                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: subtitleFontSize,
                )),
          ),
        ),
      ],
    ),
  );
}