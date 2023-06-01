import 'package:flutter/material.dart';
import 'package:mental_health_app/Reusable%20Widgets/exercise_video_card.dart';
import 'package:mental_health_app/Screens/workouts_and_yoga_screen/excercise_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/project_colors.dart';
import '../../Models/exercise.dart';
import '../../Reusable Widgets/workout_card_widget.dart';




YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'f2O6mQkFiiw',
  flags: const YoutubePlayerFlags(
    autoPlay: false,
    mute: true,
  ),
);


class YogaScreen extends StatefulWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  _YogaScreenState createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        backgroundColor: mainWhite,


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
              ),
              builder: (context, player) {
                return const Column(
                  children: [
                    // some widgets
                    //   player,
                    //some other widgets
                  ],
                );
              },
            ),




            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/03/51/12/98/360_F_351129860_I95uGc6ztv8mg5oXPivi9ljXkEZYnpov.jpg',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [

                    WorkoutCardWidget(
                      text: 'Cat Cow pose',
                      imageUrl: 'https://pbs.twimg.com/media/CgKJTktUIAASQs5.png',

                      onClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExerciseScreen(exercise: catCowPose)));
                      },
                    ),

                    WorkoutCardWidget(
                      text: 'Child pose',
                      imageUrl: 'https://static.vecteezy.com/system/resources/previews/012/598/361/original/child-pose-yoga-free-png.png',

                      onClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExerciseScreen(exercise: childPose)));

                      },
                    ),

                    WorkoutCardWidget(
                      text: 'forward bend',
                      imageUrl: 'https://www.pngkit.com/png/full/936-9362435_forward-fold-yoga-pose-forward-bend-cartoon.png',

                      onClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExerciseScreen(exercise: forwardBendPose)));
                      },
                    ),


                    WorkoutCardWidget(
                      text: 'Restorative bridge',
                      imageUrl: 'https://cdn0.iconfinder.com/data/icons/yoga-5/545/yoga6-512.png',

                      onClicked: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExerciseScreen(exercise: bridgePose)));

                      },
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


