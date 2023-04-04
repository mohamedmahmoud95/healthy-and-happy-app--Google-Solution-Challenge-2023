
import 'package:flutter/material.dart';

import '../../Constants/project_colors.dart';

class WorkoutCardWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final String imageUrl;
  int? optionalNumber;

  WorkoutCardWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.imageUrl,
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
        width: 150,
        height: 120,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              SizedBox(
                height: 110,
                  child: Image.network(imageUrl)
              ),


              const SizedBox(height: 20,),

              Text(
                text,
                style: const TextStyle(fontSize: 16, color: navyBlue, fontWeight: FontWeight.normal),
              )

            ],
          ),
        ),
      ),
    ),

  );
}
