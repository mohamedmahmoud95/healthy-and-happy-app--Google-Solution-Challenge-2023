import 'package:flutter/material.dart';

import '../Constants/project_colors.dart';

class StepsCard extends StatefulWidget {

  int steps;
  final DateTime date;

   StepsCard({
    Key? key,
    required this.steps, required this.date,
  }) : super(key: key);

  @override
  State<StepsCard> createState() => _StepsCardState();
}

class _StepsCardState extends State<StepsCard> {
  @override
  Widget build(BuildContext context) => Card(
    color: lightOrange,

    clipBehavior: Clip.hardEdge,

    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),

    child: SizedBox(
      width: 150,
      height: 120,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Text(
            (widget.date.day == DateTime.now().day && widget.date.month == DateTime.now().month)? 'Today' :  "${widget.date.day} - ${widget.date.month}",
              style: const TextStyle(fontSize: 25, color: mainPurple, fontWeight: FontWeight.normal),
            ),

           const SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SizedBox(
                 height: 30,
                   child: Image.asset ('assets/images/steps.png', color: darkOrange,)),



            const SizedBox(width: 10,),

            Text(
              '${widget.steps}',
              style:  TextStyle(fontSize: widget.steps >= 999? 20 : 30, color: mainPurple, fontWeight: FontWeight.normal),
            ),
        ],
      ),



          ],
        ),
      ),
    ),

  );
}
