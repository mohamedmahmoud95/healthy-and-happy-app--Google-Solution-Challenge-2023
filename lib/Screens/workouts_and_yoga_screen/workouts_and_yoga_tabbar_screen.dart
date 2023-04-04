
import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/workouts_and_yoga_screen/workouts_screen.dart';
import 'package:mental_health_app/Screens/workouts_and_yoga_screen/yoga_screen.dart';

import '../../../Constants/project_colors.dart';


class WorkoutAndYogaScreen extends StatefulWidget {

  const WorkoutAndYogaScreen({super.key});

  @override
  State<WorkoutAndYogaScreen> createState() => _WorkoutAndYogaScreenState();
}

class _WorkoutAndYogaScreenState extends State<WorkoutAndYogaScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar: AppBar(
            backgroundColor: mainWhite,
            leading: BackButton(color: mainPurple, onPressed: () => Navigator.pop(context),),

            elevation: 0,
            title: const Text("let's get fit",
                style: TextStyle(color: mainPurple,fontWeight: FontWeight.normal)),

            bottom:  TabBar(
              indicatorColor: mainPurple,
              labelColor: mainPurple,
              tabs: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('         Yoga   '),
                    Tab(icon: Image.asset('assets/icons/yoga.png' ),),
                  ],
                ),
                Row(
                  children: [
                    const Text('   Workouts   '),
                    Tab(icon: Image.asset('assets/icons/workout.png',),),
                  ],
                ),

              ],
            ),
          ),

          body:   const TabBarView(
            children: [
              YogaScreen(),
              WorkoutScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
