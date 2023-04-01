
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Screens/news_feed_screen/news_feed_screen.dart';
import '../../Constants/project_colors.dart';

import '../articles_screen/articles_screen.dart';
import '../home_screen/home_screen.dart';
import '../sessions_screen/consult_therapist_screen.dart';



class ScreensWrapper extends StatefulWidget {
   ScreensWrapper({Key? key,  }) : super(key: key);

  @override
  _ScreensWrapperState createState() => _ScreensWrapperState();
}

class _ScreensWrapperState extends State<ScreensWrapper> {
  int index = 0;
  final items = <Widget>[
    const Icon(
      Icons.home,
      size: 30,
      color: lightLavender,
    ),

    const Icon(
      Icons.newspaper,
      size: 30,
      color: lightLavender,
    ),

    const ImageIcon(

      AssetImage("assets/icons/therapy_session_icon.png"),
      color: lightLavender,
      size: 40,
    ),

    const ImageIcon(
      AssetImage("assets/icons/reading_icon.png"),
      color: lightLavender,
      size: 33,
    ),


  ];

  Widget returnSelectedScreen(int x ) {
    switch (x) {
      case 0:
        //news feed
        return  const HomeScreen();
      case 1:
        //self-care
        return  const NewsFeedScreen();

      case 2:
        //chat
      return  ConsultTherapistScreen();
    //    BookingPage(therapist: Therapist(name: 'Dr. ahmed fathy', photoUrl: 'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg'));

      case 3:
       // schedule a session
        return  const ArticlesScreen();//
    // ConversationScreen(thisAppUser: sampleAppUser1, otherAppUser: sampleAppUser2,);
        //ChatsWidget(appUser: sampleAppUser1,);
    }
    //--------------------------------------------------------------------//
    throw Exception();
  }

  final List<String> titles = <String>[
    "Good morning, ${sampleAppUser1.firstName} ^^",
    "Community",
    "Talk to a professional",
    " Acquire knowledge", //to edit this one, edit it in the articles screen
  ];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: index == 3 ? null :
      AppBar(
        // iconTheme: const IconThemeData(color: primaryColor, size: 30),
          backgroundColor: mainWhite,
          elevation: 0,
          title: Text(titles[index],
            style: const TextStyle(
                color: mainPurple, fontWeight: FontWeight.normal),)),

      body: returnSelectedScreen(index),


      bottomNavigationBar:
      CurvedNavigationBar(
        color: lavender,
        backgroundColor: mainWhite,
        height: 55,
        index: index,
        items: items,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
































