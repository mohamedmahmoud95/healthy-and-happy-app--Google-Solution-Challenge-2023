import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../Reusable Widgets/button_widget.dart';
import '../../screens/screens_wrapper/screens_wrapper.dart';


class PsychologicalTestsScreen extends StatefulWidget {
  @override
  _PsychologicalTestsScreenState createState() => _PsychologicalTestsScreenState();
}

class _PsychologicalTestsScreenState extends State<PsychologicalTestsScreen> {



@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: mainWhite,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainWhite,
        leading: BackButton(color: mainPurple, onPressed: () => Navigator.pop(context),),
        title: const Text('Pschycometer', style: TextStyle(color: mainPurple),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Image.asset('assets/images/online_session.png',),

                    const SizedBox(height: 12),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}


