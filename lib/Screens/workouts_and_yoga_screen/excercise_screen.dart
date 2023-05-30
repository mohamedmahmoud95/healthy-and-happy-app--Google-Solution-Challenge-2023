import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/exercise.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:mental_health_app/Reusable%20Widgets/exercise_video_card.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/project_colors.dart';
import '../../Reusable Widgets/workout_card_widget.dart';




YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'f2O6mQkFiiw',
  flags: const YoutubePlayerFlags(
    autoPlay: false,
    mute: true,
  ),
);


class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  const ExerciseScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExerciseScreenState createState() =>  _ExerciseScreenState();
}

class  _ExerciseScreenState extends State<ExerciseScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.exercise.youTubeVideoUrl!)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool howToTileIsCollapsed = true;
  Color howToTileColor = mainPurple;

  bool benefitsTileIsCollapsed = true;
  Color benefitsTileColor = mainPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: mainWhite,
        elevation: 0,
        title:  Text(widget.exercise.name!, style: const TextStyle(color: mainPurple),),
        leading: BackButton(color: mainPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 8),

            ExerciseVideoCard(exercise: catCowPose,),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: mainWhite,
                clipBehavior: Clip.hardEdge,
                shadowColor: mainPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value){
                    setState(() {
                      howToTileIsCollapsed = ! howToTileIsCollapsed;
                    });
                  },
                  collapsedBackgroundColor: page,
                  iconColor: Colors.deepOrange,
                  title:
                   Text(
                   'How to?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: howToTileIsCollapsed? mainPurple: Colors.deepOrange,),
                ),
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(widget.exercise.howTo!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                clipBehavior: Clip.hardEdge,
                shadowColor: mainPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value){
                    setState(() {
                      benefitsTileIsCollapsed = ! benefitsTileIsCollapsed;
                    });
                  },
                  collapsedBackgroundColor: page,
                  iconColor: Colors.deepOrange,
                  textColor: darkOrange,
                  collapsedTextColor: mainPurple,

                  title:
                   Text(
                    'Benefits',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: benefitsTileIsCollapsed? mainPurple: Colors.deepOrange),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(widget.exercise.benefits!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),


          //  ButtonWidget(text: "Mark as done", onClicked: (){}),

          ],
        ),
      ),
    );
  }
}



