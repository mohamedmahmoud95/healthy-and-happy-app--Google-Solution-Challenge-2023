
import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/exercise.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Constants/project_colors.dart';


class ExerciseVideoCard extends StatelessWidget {
  final Exercise exercise;
  const ExerciseVideoCard({super.key, required this.exercise, });

  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '${exercise.videoId}',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Container(
      color: mainWhite,
      margin: const EdgeInsets.all(2),
      child: Card(
        color: lightOrange,

        clipBehavior: Clip.hardEdge,
        shadowColor: mainPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

        ),

        child: InkWell(
          onTap: () {
            _launchUrl();
          },


          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(


              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                          width: double.infinity,
                          height: 200,

                          child:
                          YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                          ),
                      ),
                    ),

                    Row(
                      children: [

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                               Text( '${exercise.name}', maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: mainPurple, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                iconSize: 70,
                                  onPressed:()=> _launchUrl(),
                                  icon: Image.network(
                                  'https://w7.pngwing.com/pngs/674/324/png-transparent-youtube-logo-music-video-computer-icons-youtube-logo-text-trademark-logo.png'),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),

                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('${exercise.youTubeVideoUrl}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


}