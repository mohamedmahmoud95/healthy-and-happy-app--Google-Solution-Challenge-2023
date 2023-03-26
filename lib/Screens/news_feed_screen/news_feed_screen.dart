import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Reusable%20Widgets/card_widget.dart';
import 'package:mental_health_app/Screens/news_feed_screen/components/mood_rating_bar.dart';
import 'package:reviews_slider/reviews_slider.dart';

import '../../Constants/project_colors.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreen();

  }

class _NewsFeedScreen extends State<NewsFeedScreen> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        body: Container(
          color: mainWhite,
            child: Center(

              child: Column(
                children: [

                  const SizedBox(height:12),
                  Image.asset('assets/images/home_image.jpg'),
                  const SizedBox(height:12),



                  const Text(
                      'How are you feeling today?',
                    style: TextStyle(
                      color: navyBlue,
                      fontSize: 24
                    ),
                  ),

                  const SizedBox(height:12),

                  ReviewSlider(
                      onChange: (int value){
                        print(value);
                      }),

                 // MoodRatingBar(),
                  const SizedBox(height:12),
                  const SizedBox(height:12),

                  Wrap(
                    spacing: 12.0, // gap between adjacent chips
                    runSpacing: 12.0, // gap between lines
                    children: [



                         CardWidget(text: "Pedometer", image: 'assets/images/pedometer4.png', onClicked: (){}),

                         CardWidget(text: "Workout", image: 'assets/images/workout2.png', onClicked: (){}),


                          CardWidget(text: "Sleep tracking", image: 'assets/images/sleep.png', onClicked: (){}),

                          CardWidget(text: "Wearables", image: 'assets/images/watch.png', onClicked: (){}),



                  ],

                  ),
                ],
              )
            ),
        )
    );
  }
}




final cards = <Widget>[

  CardWidget(text: "Pedometer", image: 'assets/images/pedometer2.png', onClicked: (){}),

  CardWidget(text: "Workout", image: 'assets/images/workout2.png', onClicked: (){}),

  CardWidget(text: "Sleep tracker", image: 'assets/images/sleep.png', onClicked: (){}),

  CardWidget(text: "connect to watch", image: 'assets/images/watch.png', onClicked: (){}),

];