
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../../Reusable Widgets/button_widget.dart';

class RateUsWidget extends StatefulWidget {
  const RateUsWidget({Key? key}) : super(key: key);

  @override
  State<RateUsWidget> createState() => _RateUsWidgetState();
}

class _RateUsWidgetState extends State<RateUsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Text("Rate us ^^", style: TextStyle(color: mainPurple, fontSize: 20),),
        const SizedBox(height: 15,),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: mainOrange,
          ),
          onRatingUpdate: (rating) {
            debugPrint('App rating  = $rating');
          },
        ),

        const SizedBox(height: 15,),
        ButtonWidget(text: "Submit rating", onClicked: (){
          debugPrint("Submit rating button pressed");

        })
      ],
    );
  }
}
