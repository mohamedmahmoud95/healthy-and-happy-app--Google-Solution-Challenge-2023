
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Constants/project_colors.dart';
import '../Models/video.dart';


class VideoCard extends StatelessWidget {
  final VideoItem video;

  VideoCard({required this.video});


  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: video.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    return Container(
      color: lightLavender,
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



        // splashColor: Colors.white38,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
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

                      const SizedBox(height: 8.0),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),

                            Text(video.title, maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: navyBlue, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //
                            const SizedBox(height: 8.0),
                            Text(
                              maxLines: 3,
                              '${video.channelName } ',
                              style: const TextStyle(color: mainPurple, fontSize: 18,),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  maxLines: 3,
                                  'Description:',
                                  style: TextStyle(color: navyBlue, fontSize: 15,),
                                ),

                                IconButton(
                                  iconSize: 50,
                                  onPressed:()=> _launchUrl(),
                                  icon: Image.network(
                                      'https://w7.pngwing.com/pngs/674/324/png-transparent-youtube-logo-music-video-computer-icons-youtube-logo-text-trademark-logo.png'),
                                ),
                              ],
                            ),



                            Text(
                              maxLines: 3,
                              video.description,
                              style: const TextStyle(color: navyBlue, fontSize: 15,),
                            ),
                            const SizedBox(height: 8.0),

                          ],
                        ),
                      ),
                        SizedBox(height: 40,),

                          const SizedBox(width: 40),


                      // Row(
                      //   children: [
                      //     Row(
                      //       children: [
                      //         SizedBox(
                      //             height: 20,
                      //             child: Image.asset('assets/images/facebook.png')
                      //         ),
                      //
                      //
                      //         const SizedBox(width: 15),
                      //
                      //         SizedBox(
                      //             height: 20,
                      //             child: Image.asset('assets/images/twitter.png')
                      //         ),
                      //         SharePostWidget(numOfShares: 0),
                      //
                      //         const SizedBox(width: 4),
                      //         const Text("share",
                      //             style: TextStyle(color: navyBlue)),
                      //
                      //       ],
                      //     ),
                      //   ],
                      // ),

                    ],
                  ),


                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text("${widget.article.source}",
                  //     style: TextStyle(color: navyBlue),),
                  // ),


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
    final Uri _url = Uri.parse("https://www.youtube.com/watch?v=${video.id}");
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


}