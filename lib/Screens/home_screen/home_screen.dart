
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/news_feed_screen/news_feed_screen.dart';

import '../../Constants/project_colors.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final items = <Widget>[
    const Icon(
      Icons.home_outlined,
      size: 30,
      color: lightLavender,
    ),

    const Icon(
      Icons.newspaper_outlined,
      size: 30,
      color: lightLavender,
    ),
    const Icon(
      Icons.video_camera_front_outlined,
      size: 30,
      color: lightLavender,
    ),

    const Icon(
      Icons.chat_bubble_outline,
      color: lightLavender,
      size: 30,
    ),

  ];

  Widget returnSelectedScreen(int x ) {
    switch (x) {
      case 0:
        //news feed
        return  NewsFeedScreen();
      case 1:
        //self-care
        return  NewsFeedScreen();

      case 2:
        //chat
      return  NewsFeedScreen();

      case 3:
       // schedule a session
        return  NewsFeedScreen();
    }
    //--------------------------------------------------------------------//
    throw Exception();
  }

  final List<String> titles = <String>[
    "Home",
    "News feed",
    "Sessions",
    "Chats",
  ];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
          return Scaffold(
            appBar: AppBar(
                iconTheme: const IconThemeData(color: primaryColor, size: 30),
                backgroundColor: mainWhite,
                elevation: 0,
                title: Text(titles[index],
                    style: const TextStyle(color: Colors.black))),
            // appBar: AppBar(
            //     backgroundColor: mainWhite,
            //     title: Text(
            //       titles[index],
            //       style: const TextStyle(color: Colors.black),
            //     ),
            //     leading: IconButton(
            //       onPressed: () => Scaffold.of(ctx).openDrawer(),
            //       icon: SvgPicture.asset("assets/icons/menu.svg"),
            //     )),
         //   drawer: CustomDrawer(appUser: (state).appUser),
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

