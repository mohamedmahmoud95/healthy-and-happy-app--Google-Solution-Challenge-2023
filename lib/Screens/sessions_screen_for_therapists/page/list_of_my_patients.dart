
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../tabs/tab/list_of_my_patients_tab.dart';
import '../tabs/tab/scheduleTab.dart';


class TherapistDashboardScreen extends StatefulWidget {
  const TherapistDashboardScreen({Key? key}) : super(key: key);

  @override
  _TherapistDashboardScreenState createState() => _TherapistDashboardScreenState();
}

List<Map> navigationBarItems = [
  {'icon': Icons.local_hospital, 'index': 0},
  {'icon': Icons.calendar_today, 'index': 1},
];

class _TherapistDashboardScreenState extends State<TherapistDashboardScreen> {
  int _selectedIndex = 0;
  void goToSchedule() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: mainWhite,

      body: ListOfMyPatients(onPressedScheduleCard: () {

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleTab()));
      },),

    );
  }
}