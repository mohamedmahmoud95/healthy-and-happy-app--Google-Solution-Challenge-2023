import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../Reusable Widgets/workout_card_widget.dart';


class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: mainWhite,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.network('https://static01.nyt.com/images/2016/04/26/health/well_guides_listy_assets/well_guides_listy_assets-jumbo-v2.gif',),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        WorkoutCardWidget(
                          text: 'Desk Dips',
                          imageUrl: 'https://www.printerland.co.uk/PrinterlandImages/Image/info/Infographics/1%20-%20Desk%20Dips.gif',

                          onClicked: () {

                          },
                        ),


                        WorkoutCardWidget(
                          text: 'Knee Lifts',
                          imageUrl: 'https://www.printerland.co.uk/PrinterlandImages/Image/info/Infographics/11%20-%20Knee%20Lifts.gif',

                          onClicked: () {

                          },
                        ),

                        WorkoutCardWidget(
                          text: 'Seated Crunch',
                          imageUrl: 'https://www.printerland.co.uk/PrinterlandImages/Image/info/Infographics/6%20-%20Seated%20Torso%20Crunch.gif',

                          onClicked: () {

                          },
                        ),



                        WorkoutCardWidget(
                          text: 'Leg Raises',
                          imageUrl: 'https://www.printerland.co.uk/PrinterlandImages/Image/info/Infographics/8%20-%20Leg%20Raises.gif',

                          onClicked: () {

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


