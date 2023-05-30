


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';

import '../../Constants/project_colors.dart';
import '../../Reusable Widgets/big_card_widget.dart';
import '../../Reusable Widgets/card_widget.dart';
import '../../screens/workouts_and_yoga_screen/workouts_and_yoga_tabbar_screen.dart';
import '../psychological_tests_screen/depression_test.dart';

class AllAppFeaturesScreen extends StatefulWidget {
  const AllAppFeaturesScreen({Key? key}) : super(key: key);

  @override
  State<AllAppFeaturesScreen> createState() => _AllAppFeaturesScreenState();
}

class _AllAppFeaturesScreenState extends State<AllAppFeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: mainPurple, onPressed: ()=> Navigator.of(context).pop(),),
            iconTheme: const IconThemeData(color: mainPurple, size: 30),
            backgroundColor: mainWhite,
            elevation: 0,
            title: const Text('All in one screen',
                style: TextStyle(color: mainPurple, fontWeight: FontWeight.normal))
        ),
        body: SingleChildScrollView(
          child: Container(
            color: mainWhite,
            child: Center(
              child: Column(children: [



                const SizedBox(height: 16),




                Wrap(
                  spacing: 12.0, // gap between adjacent chips
                  runSpacing: 12.0, // gap between lines
                  children: [
                    CardWidget(
                        optionalNumber: 237,
                        text: "Pedometer",
                        image: 'assets/images/pedometer4.png',
                        onClicked: () {}),

                    CardWidget(
                        text: "Workout",
                        image: 'assets/images/workout2.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => PsychologicalTestsScreen()),);
                            MaterialPageRoute(
                                builder: (context) =>  const WorkoutAndYogaScreen()),
                          );

                        }),

                    CardWidget(
                        text: "Sleep tracking",
                        image: 'assets/images/sleep.png',
                        onClicked: () {}),

                    CardWidget(
                        text: "Wearables",
                        image: 'assets/images/watch.png',
                        onClicked: () {}),


                    BigCardWidget(
                        text: "\nPsychometer\n\n"
                            " Depression, Anxiety\n and stress scale\n",
                        image: 'assets/images/test6.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => PsychologicalTestsScreen()),);
                            MaterialPageRoute(
                                builder: (context) => DepressionTest()),
                          );
                        }),
                    //  QuestionCard(question:sampleQuestion1, selectedAnswer: 1,),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ]),
            ),
          ),
        ),

      ),
    );
  }
}
