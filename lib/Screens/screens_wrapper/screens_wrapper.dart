import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Screens/news_feed_screen/news_feed_screen.dart';
import '../../Constants/project_colors.dart';

import '../about_us_screen/about_us_screen.dart';
import '../all_app_features_screen/all_app_features_screen.dart';
import '../home_screen/home_screen.dart';
import 'package:mental_health_app/Screens/acquire_knowledge_screen/acquire_knowledge_screen.dart';

import '../settings_screen/settings_screen.dart';
import '../therapists_screen/therapists_screen.dart';

class ScreensWrapper extends StatefulWidget {
  int? passedIndex;
  ScreensWrapper({Key? key, this.passedIndex}) : super(key: key);

  @override
  _ScreensWrapperState createState() => _ScreensWrapperState();
}

class _ScreensWrapperState extends State<ScreensWrapper> {
  int bottomBarNavigatorIndex = 0;
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

  Widget returnSelectedScreen(int x) {
    switch (x) {
      case 0:
        //news feed
        return const HomeScreen();
      case 1:
        //self-care
        return const NewsFeedScreen();

      case 2:
        //chat
        return const TherapistsScreen();
      //ConsultTherapistScreen();
      //    BookingPage(therapist: Therapist(name: 'Dr. ahmed fathy', photoUrl: 'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg'));

      case 3:
        // schedule a session
        return const ArticlesScreen(); //
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
      appBar: bottomBarNavigatorIndex == 3
          ? null
          : AppBar(
              iconTheme: const IconThemeData(color: mainPurple, size: 30),
              backgroundColor: mainWhite,
              elevation: 0,
              title: Text(
                titles[bottomBarNavigatorIndex],
                style: const TextStyle(
                    color: mainPurple, fontWeight: FontWeight.normal),
              )),
      drawer: drawerWidget(),


      body: returnSelectedScreen(widget.passedIndex ?? bottomBarNavigatorIndex),
      bottomNavigationBar: CurvedNavigationBar(
        color: lavender,
        backgroundColor: mainWhite,
        height: 55,
        index: bottomBarNavigatorIndex,
        items: items,
        onTap: (index) {
          setState(() {
            bottomBarNavigatorIndex = index;
          });
        },
      ),
    );
  }

  Widget drawerWidget() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsScreen()));
            },
            child: DrawerHeader(

              decoration: const BoxDecoration(
                color: lavender,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: mainWhite,
                    child: CircleAvatar(
                      radius: 50,
                      foregroundImage:
                      AssetImage('${thisAppUser.profilePicUrl}'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${thisAppUser.firstName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            thisAppUser.firstName!.length > 8 ? 16 : 24,
                            overflow: TextOverflow.clip),
                      ),
                      Text(
                        '${thisAppUser.lastName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: thisAppUser.lastName!.length > 8 ? 16 : 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Divider(
              color: Colors.transparent,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.home,
              color: mainPurple,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: mainPurple, fontSize: 20),
            ),
            onTap: () {
              setState(() {
               // bottomBarNavigatorIndex = 0; // Navigate to home screen
              });
              Navigator.pop(context); // Pop the drawer
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Divider(
              color: lavender,
            ),
          ),



          ListTile(
            leading: const Icon(
              Icons.grid_view_outlined,
              color: mainPurple,
            ),
            title: const Text(
              'All app features',
              style: TextStyle(color: mainPurple, fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllAppFeaturesScreen()));
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Divider(
              color: lavender,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.settings,
              color: mainPurple,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: mainPurple, fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const SettingsScreen()));
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Divider(
              color: lavender,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.people,
              color: mainPurple,
            ),
            title: const Text(
              'About us',
              style: TextStyle(color: mainPurple, fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const AboutUsScreen()));
            },
          ),


          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Divider(
              color: lavender,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.logout,
              color: mainPurple,
            ),
            title: const Text(
              'logout',
              style: TextStyle(color: mainPurple, fontSize: 20),
            ),
            onTap: () {
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(Navigator
                      .defaultRouteName)); // Navigate back until the login screen is reached.
            },
          ),
        ],
      ),
    );
  }
}
