import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MoodRatingBar extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) => RatingBar.builder(
        initialRating: 3,
        itemCount: 5,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Column(
                children: const [
                  Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  ),
                ],
              );
            case 1:
              return const Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.redAccent,
              );
            case 2:
              return const Icon(
                Icons.sentiment_neutral,
                color: Colors.amber,
              );
            case 3:
              return const Icon(
                Icons.sentiment_satisfied,
                color: Colors.lightGreen,
              );
            case 4:
              return const Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
              );
          }
          throw Exception();
        },
        onRatingUpdate: (rating) {
          print(rating);
        },
      );
}
