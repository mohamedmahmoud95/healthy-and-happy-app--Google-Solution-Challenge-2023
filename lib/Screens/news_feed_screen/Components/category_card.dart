
import 'package:flutter/material.dart';

import '../../../Constants/project_colors.dart';


class CategoryCard extends StatefulWidget {
  final String text;
  static int numOfTappedCards = 0;
  static Color colorOfOtherCards = lightOrange;
  bool CategoryCardSelected = false;

   CategoryCard({
    Key? key,
    required this.text,
    required this.CategoryCardSelected,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  Color defaultCardColor = lightOrange;
  Color tappedCardColor = mainOrange;
  Color cardColor = lightOrange;
  Color textColor = navyBlue;
  Color tappedCardTextColor = mainWhite;
  Color defaultCardTextColor = navyBlue;

  @override
  Widget build(BuildContext context) => Card(

    color: widget.CategoryCardSelected? tappedCardColor:defaultCardColor,

    clipBehavior: Clip.hardEdge,

    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),

    child: InkWell(
      onTap: () {
        setState(() {
          widget.CategoryCardSelected = ! widget.CategoryCardSelected;
          if (widget.CategoryCardSelected) {
            CategoryCard.numOfTappedCards +=1;
          }
          else {
            cardColor = CategoryCard.colorOfOtherCards;
          }

          if (CategoryCard.numOfTappedCards <= 1) {
            cardColor == defaultCardColor ? cardColor = mainOrange : cardColor =
                lightOrange;
          }
          else
            {
              cardColor = defaultCardColor;
            }
        });

        debugPrint('${widget.text} category card tapped.');
      },

      splashColor:  Colors.white38,

      child:  SizedBox(
        width: 130,
        height: 50,

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.text,
                  style:  TextStyle(
                      fontSize: 15,
                      color: widget.CategoryCardSelected? tappedCardTextColor:defaultCardTextColor,
                      fontWeight: FontWeight.w600),
                ),
          ),
        ),
      ),
    ),
  );
}
