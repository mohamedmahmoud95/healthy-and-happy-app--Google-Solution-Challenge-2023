
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_normal_users/therapists_list_screen.dart';

import '../../screens/sessions_screen_for_therapists/tabs/tab/scheduleTab.dart';



class ConsultTherapistScreen extends StatefulWidget {
  @override
  _ConsultTherapistScreenState createState() => _ConsultTherapistScreenState();
}

class _ConsultTherapistScreenState extends State<ConsultTherapistScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mainWhite,

        body: SafeArea(
          child: Wrap(
            direction: Axis.vertical,
            children: [ Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Image.asset('assets/images/online_session.png',scale: 1.5,),

                        const SizedBox(height: 30),

                        const Align(
                          alignment: Alignment.center,
                          child: Text(

                            "You take, We help \n\n"
                                "Talk to your therapist online, \n\n"
                                "privately, anytime, anywhere!",
                            textAlign: TextAlign.center,
                            style: TextStyle(

                              color: mainPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),



                        const SizedBox(height: 30),

                        Center(
                          child: ButtonWidget(text: 'My calendar',
                            onClicked: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ScheduleTab()),
                            ),
                          ),
                        ),
                        Center(
                          child: ButtonWidget(text: 'Book a session',
                            onClicked: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  TherapistListScreen()),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}


