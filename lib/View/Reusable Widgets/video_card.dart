
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Constants/project_colors.dart';

import '../../Models/video.dart';



class VideoCard extends StatelessWidget {
  final VideoItem video;

  VideoCard({required this.video});


  @override
  Widget build(BuildContext context) {

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
                        Image.network(video.thumbnailUrl,
                          fit: BoxFit.cover,
                        )
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
                            const SizedBox(height: 8.0),

                            Text(
                              maxLines: 3,
                              'Description:\n${video.description } ',
                              style: const TextStyle(color: navyBlue, fontSize: 15,),
                            ),
                            const SizedBox(height: 8.0),


                            const SizedBox(width: 40),
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