
import 'package:flutter/material.dart';

import '../Constants/project_colors.dart';

class BigCardWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final String image;
  int? optionalNumber;

  BigCardWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.image,
    this.optionalNumber,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => Card(
    color: lightOrange,

    clipBehavior: Clip.hardEdge,

shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
  ),

    child: InkWell(
      onTap: () {
        onClicked();
        debugPrint('$text card tapped.');
      },

      splashColor:  Colors.white38,

      child:  SizedBox(
        width: 320,
        height: 120,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.center,

            children: [


                    Text(
                    text,

                    style: const TextStyle(fontSize: 15, color: navyBlue, fontWeight: FontWeight.normal),
                  ),

              //circular border
              CircleAvatar(
                backgroundColor: mainOrange,
                radius: 40,

//icon/image
                child: CircleAvatar(
                  // backgroundColor: mainWhite,
                  radius: 38,
                  backgroundImage: AssetImage (image),
                ), //CircleAvatar
              ), //CircleAvatar
            ],
          ),
        ),
      ),
    ),

  );
}
