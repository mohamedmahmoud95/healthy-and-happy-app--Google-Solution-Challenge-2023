



//Please note that this is not the widget currently in use to create a new post
//we replaced it with another widget defined in the news_feed_screen class
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../../Models/post.dart';

class NewPostWidget extends StatefulWidget {
  const NewPostWidget({super.key});

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(

      backgroundColor: mainBlue,
      onPressed: () {

        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: mainWhite,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    const SizedBox(height: 15,),
                    TextFormField(
                      minLines: 8,
                      maxLines: 15,
                      style: const TextStyle(
                        color: navyBlue,
                      ),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(

                        hintText: "What's on your mind?",
                        hintStyle: TextStyle(
                          color: mainBlue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0)),
                        ),
                      ),
                    ),
//   ],
// ),
                    const SizedBox(height: 8,),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: mainBlue,
                            ),
                            SizedBox(width: 4),
                            Text(" Image",
                                style: TextStyle(color: navyBlue)),
                          ],
                        ),

                        SizedBox(width: 30,),

                        Row(
                          children: [
                            Icon(
                              Icons.video_camera_back_outlined,
                              color: mainBlue,

                            ),
                            SizedBox(width: 4),
                            Text(" Video",
                                style: TextStyle(color: navyBlue)),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 8,),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: mainWhite,
                        backgroundColor: mainBlue,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Publish',
                        style: TextStyle(
                          color: mainWhite,

                        ),

                      ),
                      onPressed: () => Navigator.pop(context),
// onFocusChange: ,
                    ),
                    const SizedBox(height: 8,),

                  ],
                ),
              ),
            );
//    );
          },
        );
      },

      child: const Icon(
        Icons.edit,
      ),
    );
  }
}