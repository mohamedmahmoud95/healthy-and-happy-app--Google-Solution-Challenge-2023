import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../../Models/post.dart';

class SharePostWidget extends StatefulWidget {
  int numOfShares;
  SharePostWidget( {required this.numOfShares,super.key});

  @override
  State<SharePostWidget> createState() => _SharePostWidgetState();
}

class _SharePostWidgetState extends State<SharePostWidget> {

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

                        hintText: "You may add a caption here...",
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


                        const SizedBox(width: 30,),



                    const SizedBox(height: 8,),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: mainWhite,
                        backgroundColor: mainBlue,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Share',
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
      }, icon: Icon(
      Icons.share,
      color: widget.numOfShares > 0
          ? mainBlue
          : Colors.black,
    ),
    );
  }
}