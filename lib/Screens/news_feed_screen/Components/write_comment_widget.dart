import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../../Models/post.dart';

class WriteCommentWidget extends StatefulWidget {
  int numOfComments;
   WriteCommentWidget( {required this.numOfComments,super.key});

  @override
  State<WriteCommentWidget> createState() => _WriteCommentWidgetState();
}

class _WriteCommentWidgetState extends State<WriteCommentWidget> {

  @override
  Widget build(BuildContext context) {
    return IconButton(


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

                        hintText: "Write your comment here...",
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.image_outlined,
                              color: mainBlue,
                            ),
                            SizedBox(width: 4),
                            Text(" Image",
                                style: TextStyle(color: navyBlue)),
                          ],
                        ),

                        const SizedBox(width: 30,),


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
                        'Comment',
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
      }, icon:  Icon(
      Icons.comment_rounded,
        color: widget.numOfComments > 0
          ? mainBlue
          : Colors.black,
    ),
    );
  }
}