
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:mental_health_app/Reusable%20Widgets/show_popup_dialog.dart';
import 'package:mental_health_app/Reusable%20Widgets/steps_card_widget.dart';


import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../Reusable Widgets/show_snackbar_widget.dart';


class StepData {
  final DateTime date;
  final int steps;

  StepData(this.date, this.steps);
}



class PedometerScreen extends StatefulWidget {
  const PedometerScreen({Key? key}) : super(key: key);

  @override
  State<PedometerScreen> createState() => _PedometerScreenState();
}

class _PedometerScreenState extends State<PedometerScreen> {
  TextEditingController _stepsController = TextEditingController();
  HealthFactory health = HealthFactory();
  int _getSteps = 0;


  Future fetchStepData(DateTime date) async {
    int? steps = 0;
    var types = [
      HealthDataType.STEPS,
    ];
    final midnight = DateTime(date.year, date.month, date.day);
    var permissions = [
      HealthDataAccess.READ,
    ];

    bool requested =
    await health.requestAuthorization(types, permissions: permissions);
    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, date);
      } catch (error) {
        debugPrint("Caught exception in getTotalStepsInInterval: $error");
      }
      debugPrint('Total number of steps: $steps');
      setState(() {
        _getSteps = (steps == null) ? 0 : steps;
      });
    } else {
      debugPrint("Authorization not granted - error in authorization");
    }
  }


  @override
  void initState() {
    super.initState();
    fetchStepData(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mainWhite,
        appBar: AppBar(
            leading: BackButton(
              color: mainPurple,
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: const IconThemeData(color: mainPurple, size: 30),
            backgroundColor: mainWhite,
            elevation: 0,
            title: const Text('Pedometer',
                style: TextStyle(
                    color: mainPurple, fontWeight: FontWeight.normal),
            ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: StepsCard(steps: _getSteps, date: DateTime.now(),),
              ),

            SizedBox(height: height/10,),
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Last 30 days:',
                      style: TextStyle(
                          color: mainPurple, fontWeight: FontWeight.normal, fontSize: 30),
                    ),
                  ),
                ),


             SizedBox(height: height/30,),
            SizedBox(
              height: 150,
              width: double.infinity,
              child:  Row(
                children: [

                  Expanded(

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,


                      itemCount: 30,
                      itemBuilder: (context, index) {
                        final date = DateTime.now().subtract(Duration(days: index));
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: StepsCard(steps: _getSteps, date: date),
                        );

                      },
                    ),
                  ),

                ],
              ),
            ),
              ],
            ),
            SizedBox(height: height/10,),

            ButtonWidget(childWidget:  SizedBox(height: 20,child: Image.asset ('assets/images/steps.png',color: mainWhite,)),
            text: 'Enter manually', onClicked: (){
              showPopUpDialog(title: 'Enter your steps manually', actionText: 'Update', context: context, codeController: _stepsController, onPressed: (){
                Navigator.of(context).pop();
              });
                }),
          ],
        ),
          // Text(
          //   "Steps = ${_getSteps} ",
          //
          // ),
        ),

    );
  }

  Future enterStepsManuallyDialog() => showDialog(

  context: context,
  barrierDismissible: true,
  builder: (context) => AlertDialog(

  title: const Text("Enter today's steps manually", style: TextStyle(color: mainPurple, fontSize: 20),),
  backgroundColor: mainWhite,
  elevation: 2,
  shape:  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12),
  ),
  content: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
  TextField(
  controller: _stepsController,
  style:  const TextStyle(color: Colors.black),

  decoration: InputDecoration(
  hintText: "How many steps do you make today..?",
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: const OutlineInputBorder(
  borderSide: BorderSide(color: lavender),
  ),
  ),
  maxLines: 3,
  ),
  ],
  ),
  actions: <Widget>[

  TextButton(
  onPressed: (){
    try {
      _getSteps = int.parse(_stepsController.text);
    } catch (e) {
      debugPrint('Error parsing steps: $e');
    }
Navigator.of(context).pop();
  showSnackBar(context, "Today's steps modified to ${_stepsController.text}");
  },
  child: const Text("update", style: TextStyle(color: mainBlue, )),
  ),

  TextButton(
  onPressed: (){ Navigator.of(context).pop(); },
  child: const Text("Cancel", style: TextStyle(color: Colors.red, )),
  )
  ],
  ),
  );
}


