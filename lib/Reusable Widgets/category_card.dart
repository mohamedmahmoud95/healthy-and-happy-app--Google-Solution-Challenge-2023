
import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/category.dart';

import '../../../Constants/project_colors.dart';


class CategoryCard extends StatefulWidget {
  PostCategory category;
  PostCategory selectedCategory;
  final VoidCallback onSelected;
  CategoryCard({
    Key? key,
    required this.category,
    required this.selectedCategory,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  Color notSelectedColor = lightOrange;
  Color selectedColor = mainOrange;
  Color cardColor = lightOrange;
  Color textColor = navyBlue;
  Color selectedTextColor = mainWhite;
  Color notSelectedTextColor = navyBlue;



  @override
  Widget build(BuildContext context) =>

      Card(

    color: widget.selectedCategory == widget.category? selectedColor:notSelectedColor,

    clipBehavior: Clip.hardEdge,

    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),

    child: InkWell(
      onTap: () {
        setState(() {
          widget.onSelected();
          debugPrint('${widget.category.categoryName} category card tapped.');
        },
        );
      },

      splashColor:  Colors.white38,

      child:  SizedBox(
        width: 120,
        height: 50,

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.category.categoryName,
                  style:  TextStyle(
                      fontSize: 15,
                      color:  widget.selectedCategory == widget.category? selectedTextColor:notSelectedTextColor,
                      fontWeight: FontWeight.w600),
                ),
          ),
        ),
      ),
    ),
  );
}
